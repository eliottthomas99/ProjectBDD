USE bibliotheque;

SET @plafondPenalite = 1;
SET @maxRenouvellement = 3;

DELIMITER $$

DROP PROCEDURE IF EXISTS reserverContenuEmprunte$$
CREATE PROCEDURE reserverContenuEmprunte(IN contenuValCodeBarre INT, contenuValNumeroLicense INT,abonneValNumero INT)
# Un client a constaté qu'un contenu est emprunté et souhaite le reserver
RESERVERCONTENUEMPRUNTE_LABEL:BEGIN
	
	SET @verifEmprunt = (select count(*) from emprunt where Contenu_Code_Barre=contenuValCodeBarre and Contenu_Numero_License=contenuValNumeroLicense and date_retour IS NULL);
    #verif emprunt vaut 1 si le contenu est emprunté, 0 sinon.
    IF @verifEmprunt=0 THEN 
		LEAVE RESERVERCONTENUEMPRUNTE_LABEL;
    END IF;
    
    #le contenu est bien déjà emprunté, on peut le reserver.
    # On vérifie qu'il n'ai pas de pénalité.
    SET @penalite = (SELECT penalite from abonne where numero=abonneValNumero);
    IF @penalite!=0 THEN 
		LEAVE RESERVERCONTENUEMPRUNTE_LABEL;
	END IF;
    
    # L'abonne n'a pas de pénalité, il peut emprunter s'il n'a pas plus de 3 demandes en cours.
    SET @demandes = (SELECT count(*) from demande where Abonne_numero=abonneValNumero);
    
    IF @demande>3 THEN 
		LEAVE RESERVERCONTENUEMPRUNTE_LABEL;
	END IF;
    #On peut finalement réserver
    
    INSERT INTO demande (Contenu_Code_Barre,Contenu_Numero_License,Abonne_Numero,date_demande)
      SELECT contenuValCodeBarre,contenuValNumeroLicense,abonneValNumero,curdate()
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM demande
                  WHERE Contenu_Code_Barre = contenuValCodeBarre and
						Contenu_Numero_License=contenuValNumeroLicense and
                        Abonne_Numero=abonneValNumero and
                        date_demande=curdate()
                  LIMIT 1
            );
    
    
    
END;








DROP PROCEDURE IF EXISTS nombreEmprunt$$
CREATE PROCEDURE nombreEmprunt(IN abonneValNumero INT)
# retourne le nombre de contenu qu un abonne n a pas encore rendu
NOMBREEMPRUNT_LABEL:BEGIN
	SELECT COUNT(*) FROM emprunt WHERE Abonne_numero = abonneValNumero;
END;



DROP PROCEDURE IF EXISTS emprunterContenu$$ 
CREATE PROCEDURE emprunterContenu(IN contenuValCodeBarre INT, contenuValNumeroLicense INT,abonneValNumero INT)
# l'usager emprunte un contenu
EMPRUNTERCONTENU_LABEL:BEGIN
# On regarde si le contenu est demande (sur liste d attente)
IF EXISTS (SELECT * FROM demande WHERE Contenu_Code_Barre=contenuValCodeBarre AND Contenu_Numero_License=contenuValNumeroLicense) THEN
	# Si la personne qui veut emprunter n a pas fait de demande on refuse l emprunt
	IF NOT EXISTS (SELECT * FROM demande WHERE Contenu_Code_Barre=contenuValCodeBarre AND Contenu_Numero_License=contenuValNumeroLicense AND Abonne_numero = abonneValNumero) THEN 
		LEAVE EMPRUNTERCONTENU_LABEL;
	END IF;
END IF;
# On regarde si l abonne a deja 5 ou plus emprunts en cours
IF (SELECT COUNT(*) FROM emprunt WHERE Abonne_numero = abonneValNumero) >= 5 THEN 
	LEAVE EMPRUNTERCONTENU_LABEL;	
END IF;
# Sinon on regarde le niveau de penalite de l abonne
IF (SELECT penalite FROM abonne WHERE numero = abonneValNumero) >= @plafondPenalite THEN
	LEAVE EMPRUNTERCONTENU_LABEL;	
END IF;
# Sinon on permet l emprunt
INSERT INTO emprunt(Contenu_Code_Barre, Contenu_Numero_License,Abonne_numero,date_pret)
      SELECT contenuValCodeBarre,
            contenuValNumeroLicense,
            abonneValNumero,
            CURDATE()
            
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM emprunt
                  WHERE Contenu_Code_Barre=contenuValCodeBarre AND 
                        Contenu_Numero_License=contenuValNumeroLicense AND
                        date_retour IS NULL
                  LIMIT 1
            );
# On retire toutes les demandes concernant ce code catalogue
SET @codeCatalogue = (SELECT codeCatalogue FROM contenu WHERE Code_Barre=contenuValCodeBarre AND Numero_License=contenuValNumeroLicense);
DELETE FROM demande WHERE ((Contenu_Code_Barre, Contenu_Numero_License) IN (SELECT Code_Barre,Numero_License FROM contenu WHERE codeCatalogue = @codeCatalogue)) AND Abonne_numero = abonneValNumero;

END;
$$


DROP PROCEDURE IF EXISTS rendreContenu$$ 
CREATE PROCEDURE rendreContenu(IN contenuValCodeBarre INT, contenuValNumeroLicense INT)
# l'usager rend un contenu
RENDRECONTENU_LABEL:BEGIN
# On regarde si l abonne rend son contenu dans les temps
SET @dateDebut = (SELECT date_pret FROM emprunt WHERE Contenu_Code_Barre = contenuValCodeBarre AND Contenu_Numero_License = contenuValNumeroLicense and date_retour IS NULL);
SET @dateFin = CURDATE();
IF (SELECT support FROM contenu WHERE Code_Barre = contenuValCodeBarre AND Numero_License = contenuValNumeroLicense) = "livre" OR
	(SELECT support FROM contenu WHERE Code_Barre = contenuValCodeBarre AND Numero_License = contenuValNumeroLicense) = "ebook" THEN
	SET @delai = 15 * ((SELECT renouvellement FROM emprunt WHERE Contenu_Code_Barre = contenuValCodeBarre AND Contenu_Numero_License = contenuValNumeroLicense and date_retour IS NULL) + 1);
ELSE
	SET @delai = 7 * ((SELECT renouvellement FROM emprunt WHERE Contenu_Code_Barre = contenuValCodeBarre AND Contenu_Numero_License = contenuValNumeroLicense and date_retour IS NULL) + 1);
END IF;
IF DATEDIFF(@dateFin, @dateDebut) > @delai THEN
	UPDATE abonne SET penalite = penalite + 1 WHERE numero = (SELECT Abonne_numero FROM emprunt WHERE Contenu_Code_Barre = contenuValCodeBarre AND Contenu_Numero_License = contenuValNumeroLicense and date_retour IS NULL);	
END IF;
UPDATE emprunt 
SET 
    date_retour = CURDATE()
WHERE
    Contenu_Code_Barre = contenuValCodeBarre
        AND Contenu_Numero_License = contenuValNumeroLicense
        AND date_retour IS NULL LIMIT 1;
            


END;
$$



DROP PROCEDURE IF EXISTS renouvelerEmprunt$$ 
CREATE PROCEDURE renouvelerEmprunt(IN contenuValCodeBarre INT, contenuValNumeroLicense INT)
# permet de renouveler un emprunt si personne ne l a reserve
RENOUVELEREMPRUNT_LABEL:BEGIN
	# On commence par s assurer que le contenu est emprunte
    IF (SELECT COUNT(*) FROM emprunt WHERE Contenu_Code_Barre = contenuValCodeBarre AND Contenu_Numero_License = contenuValNumeroLicense AND date_retour IS NULL) = 0 THEN 
		LEAVE RENOUVELEREMPRUNT_LABEL;
	# On regarde si il y a une reservation pour le contenu
	ELSEIF (SELECT COUNT(*) FROM demande WHERE Contenu_Code_Barre = contenuValCodeBarre AND Contenu_Numero_License = contenuValNumeroLicense) >= 1 THEN
		LEAVE RENOUVELEREMPRUNT_LABEL;
	# On regarde si l emprunt n a pas depasse le plafond de renouvellement
	ELSEIF (SELECT renouvellement FROM emprunt WHERE Contenu_Code_Barre = contenuValCodeBarre AND Contenu_Numero_License = contenuValNumeroLicense AND date_retour IS NULL) >= @maxRenouvellement THEN
		LEAVE RENOUVELEREMPRUNT_LABEL;
	END IF;
    # Si on est dans le dernier crenau de temps, alors on peut etendre l emprunt
	SET @dateDebut = (SELECT date_pret FROM emprunt WHERE Contenu_Code_Barre = contenuValCodeBarre AND Contenu_Numero_License = contenuValNumeroLicense and date_retour IS NULL);
	IF (SELECT support FROM contenu WHERE Code_Barre = contenuValCodeBarre AND Numero_License = contenuValNumeroLicense) = "livre" OR
		(SELECT support FROM contenu WHERE Code_Barre = contenuValCodeBarre AND Numero_License = contenuValNumeroLicense) = "ebook" THEN
        SET @reservationBas = ADDDATE(@dateDebut, INTERVAL 15 * (SELECT renouvellement FROM emprunt WHERE Contenu_Code_Barre = contenuValCodeBarre AND Contenu_Numero_License = contenuValNumeroLicense and date_retour IS NULL) DAY);
        SET @reservationHaut = ADDDATE(@dateDebut, INTERVAL 15 * ((SELECT renouvellement FROM emprunt WHERE Contenu_Code_Barre = contenuValCodeBarre AND Contenu_Numero_License = contenuValNumeroLicense and date_retour IS NULL) + 1) DAY);
        IF CURDATE() >= @reservationBas AND CURDATE() <= @reservationHaut THEN
			UPDATE emprunt SET renouvellement = renouvellement + 1 WHERE Contenu_Code_Barre = contenuValCodeBarre AND Contenu_Numero_License = contenuValNumeroLicense and date_retour IS NULL;
        END IF;
	ELSE
		SET @reservationBas = ADDDATE(@dateDebut, INTERVAL 7 * (SELECT renouvellement FROM emprunt WHERE Contenu_Code_Barre = contenuValCodeBarre AND Contenu_Numero_License = contenuValNumeroLicense and date_retour IS NULL) DAY);
        SET @reservationHaut = ADDDATE(@dateDebut, INTERVAL 7 * ((SELECT renouvellement FROM emprunt WHERE Contenu_Code_Barre = contenuValCodeBarre AND Contenu_Numero_License = contenuValNumeroLicense and date_retour IS NULL) + 1) DAY);
        IF CURDATE() >= @reservationBas AND CURDATE() <= @reservationHaut THEN
			UPDATE emprunt SET renouvellement = renouvellement + 1 WHERE Contenu_Code_Barre = contenuValCodeBarre AND Contenu_Numero_License = contenuValNumeroLicense and date_retour IS NULL;
        END IF;
	END IF;

END;
$$




DROP PROCEDURE IF EXISTS renouvelerAbonnement$$ 
CREATE PROCEDURE renouvelerAbonnement(IN abonneValNumero INT)
# permet de renouveler un emprunt si personne ne l a reserve
RENOUVELERABONNEMENT_LABEL:BEGIN
	IF NOT EXISTS (SELECT * FROM abonne WHERE numero = abonneValNumero) THEN
		LEAVE RENOUVELERABONNEMENT_LABEL;
	END IF;
	UPDATE abonne SET dateAdhesion = CURDATE() WHERE numero = abonneValNumero;
END;
$$


DROP PROCEDURE IF EXISTS echeancier$$ 
CREATE PROCEDURE echeancier()
# Affiche la liste de tous les documents qui devraient etre rendu ainsi que les abonnes les possedant
ECHEANCIER_LABEL:BEGIN
	SELECT nom, prenom, adresse AS email, Code_Barre,Numero_License, Titre, Support FROM Contenu
    JOIN emprunt 
		ON Contenu.Code_Barre = emprunt.Contenu_Code_Barre AND Contenu.Numero_License = emprunt.Contenu_Numero_License
	JOIN abonne 
		ON abonne.numero = emprunt.Abonne_Numero
    WHERE (((Support = "livre" OR Support = "ebook") AND DATEDIFF(CURDATE(), ADDDATE(date_pret, INTERVAL 15 * (renouvellement + 1) DAY)) > 0)
		OR ((Support != "livre" AND Support != "ebook") AND DATEDIFF(CURDATE(), ADDDATE(date_pret, INTERVAL 7 * (renouvellement + 1) DAY)) > 0))
        AND date_retour IS NULL;
END;
$$


DROP PROCEDURE IF EXISTS empruntCount$$ 
CREATE PROCEDURE empruntCount()
# Affiche le nombre de contenus en cours d emprunt par bibliotheque
empruntCount_LABEL:BEGIN
	SELECT COUNT(*) as emprunts, etablissement.nom FROM Contenu
    JOIN possede 
		ON Contenu.Code_Barre = possede.Contenu_Code_Barre AND Contenu.Numero_License = possede.Contenu_Numero_License
	JOIN etablissement 
		ON etablissement.id = Etablissement_id
    JOIN emprunt 
		ON Contenu.Code_Barre = emprunt.Contenu_Code_Barre AND Contenu.Numero_License = emprunt.Contenu_Numero_License
    WHERE emprunt.date_retour IS NULL
	GROUP BY Etablissement_id;
END;
$$

DROP PROCEDURE IF EXISTS clientEmpruntantCount$$ 
CREATE PROCEDURE clientEmpruntantCount()
# Affiche le nombre de clients ayant au moins un emprunt en cours
clientEmpruntantCount_LABEL:BEGIN
	SELECT COUNT(DISTINCT emprunt.Abonne_numero) as "emprunts en cours" FROM Contenu
    JOIN emprunt 
		ON Contenu.Code_Barre = emprunt.Contenu_Code_Barre AND Contenu.Numero_License = emprunt.Contenu_Numero_License
    WHERE emprunt.date_retour IS NULL;
END;
$$

DROP PROCEDURE IF EXISTS contenuPopulaire$$ 
CREATE PROCEDURE contenuPopulaire(IN limite INT)
# Affiche le nombre d emprunt qu un contenu a recu
contenuPopulaire_LABEL:BEGIN
    SELECT COUNT(*) AS emprunts, titre, support FROM contenu
    JOIN emprunt 
		ON Contenu.Code_Barre = emprunt.Contenu_Code_Barre AND Contenu.Numero_License = emprunt.Contenu_Numero_License
    GROUP BY codeCatalogue # catalogue ou code barre et numero license ?
    ORDER BY COUNT(*) DESC LIMIT limite;
END;
$$


DROP PROCEDURE IF EXISTS supportPopulaire$$ 
CREATE PROCEDURE supportPopulaire(IN limite INT)
# Affiche le nombre d ermprunts par support
supportPopulaire_LABEL:BEGIN
    SELECT COUNT(*) AS emprunts, support FROM contenu
    JOIN emprunt 
		ON Contenu.Code_Barre = emprunt.Contenu_Code_Barre AND Contenu.Numero_License = emprunt.Contenu_Numero_License
    GROUP BY support 
    ORDER BY COUNT(*) DESC LIMIT limite;
END;
$$





DELIMITER ;

/*
CALL emprunterContenu(10,0,12);
CALL emprunterContenu(20,0,12);
CALL emprunterContenu(30,0,12);
CALL emprunterContenu(40,0,12);
CALL emprunterContenu(50,0,12);
CALL emprunterContenu(0,60,12); # refuse l emprunt d un contenu car il y a deja 5 emprunts en cours
*/

#CALL renouvelerEmprunt(10,0);

#CALL rendreContenu(0,60);


#CALL nombreEmprunt(12);

#UPDATE `bibliotheque`.`abonne` SET `penalite` = '0' WHERE (`numero` = '11');
#CALL emprunterContenu(0,70,11); # ne devrait pas fonctionner car penalite trop haute

/*
# Je rend en retard
CALL emprunterContenu(0,70,11);
UPDATE `bibliotheque`.`emprunt` SET `date_pret` = '2020-01-01' WHERE (`Contenu_Code_Barre` = '0000000000') and (`Contenu_Numero_License` = '0000000070') and (`Abonne_numero` = '11') and (`date_pret` = '2020-12-16');
CALL rendreContenu(0,70);
*/

/*
# Julien emprunte, Eliott reserve, Julien essaie d etendre sa reservation
CALL emprunterContenu(0,70,11);
CALL reserverContenuEmprunte(0 , 70,13);
CALL renouvelerEmprunt(0,70);
# Test OK, le renouvellement n est pas effectue
*/

/*
# renouvelement abonnement d une personne pas abonne et d un abonne
CALL renouvelerAbonnement(1);
CALL renouvelerAbonnement(11);
*/

#CALL echeancier();

/*
# Le contenu que je veux emprunter n est pas dispo, je le reserve
CALL emprunterContenu(10,0,12);
CALL reserverContenuEmprunte(10,0,11);
*/

/*
# je veux emprunter un contenu que quelqu un d autre a reserve
CALL emprunterContenu(0,60,12);
CALL emprunterContenu(0,70,12);
CALL reserverContenuEmprunte(0,60,11);
CALL reserverContenuEmprunte(0,70,11);
CALL reserverContenuEmprunte(0,60,13);
CALL reserverContenuEmprunte(0,70,13);
CALL rendreContenu(0,60);
*/
CALL emprunterContenu(0,60,13);







/* stats */
#CALL empruntCount();
#CALL clientEmpruntantCount();
#CALL contenuPopulaire(3);
#CALL supportPopulaire(3);
#CALL rendreContenu(0,70);