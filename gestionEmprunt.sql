USE bibliotheque;

SET @plafondPenalite = 1;

DELIMITER $$

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
# On regarde si l abonne a deja 5 ou plus emprunts en cours
IF (SELECT COUNT(*) FROM emprunt WHERE Abonne_numero = abonneValNumero) >= 5 THEN 
	LEAVE EMPRUNTERCONTENU_LABEL;	
END IF;
# Sinon on regarde le niveau de penalite de l abonne
IF (SELECT penalite FROM abonne WHERE numero = abonneValNumero) >= @plafondPenalite THEN # TODO passer par une var globale pour calibrer la penalite
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




DELIMITER ;

CALL emprunterContenu(10,0,12);
CALL emprunterContenu(20,0,12);
CALL emprunterContenu(30,0,12);
CALL emprunterContenu(40,0,12);
CALL emprunterContenu(50,0,12);
CALL emprunterContenu(60,0,12); # refuse l emprunt d un contenu car il y a deja 5 emprunts en cours

#CALL rendreContenu(0,60);


#CALL nombreEmprunt(12);

#UPDATE `bibliotheque`.`abonne` SET `penalite` = '0' WHERE (`numero` = '11');
#CALL emprunterContenu(0,70,11); # ne devrait pas fonctionner car penalite trop haute

# je rend en retard
#CALL emprunterContenu(0,70,11);
#UPDATE `bibliotheque`.`emprunt` SET `date_pret` = '2020-01-01' WHERE (`Contenu_Code_Barre` = '0000000000') and (`Contenu_Numero_License` = '0000000070') and (`Abonne_numero` = '11') and (`date_pret` = '2020-12-16');
#CALL rendreContenu(0,70);