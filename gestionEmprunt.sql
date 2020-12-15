USE bibliotheque;

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


UPDATE emprunt SET date_retour= CURDATE()
	  WHERE Contenu_Code_Barre=contenuValCodeBarre AND 
			Contenu_Numero_License=contenuValNumeroLicense AND
			date_retour IS NULL
	  LIMIT 1;
            


END;
$$


DROP PROCEDURE IF EXISTS afficherDispo$$ 
CREATE PROCEDURE afficherDispo()
# l'usager veut connaitre les contenu disponibles
AFFICHERDISPO_LABEL:BEGIN


SELECT * FROM contenu 

WHERE (Code_Barre,Numero_License) NOT IN 


(SELECT Contenu_Code_Barre,Contenu_Numero_License 
FROM Emprunt 
WHERE date_retour IS NULL);


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
#CALL afficherDispo();

#CALL nombreEmprunt(12);