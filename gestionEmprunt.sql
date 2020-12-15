use bibliotheque;

DELIMITER $$
drop procedure if exists emprunterContenu$$ 
CREATE PROCEDURE emprunterContenu(IN contenuValCodeBarre INT, contenuValNumeroLicense INT,abonneValNumero INT)
# l'usager emprunte un contenu
emprunterContenu_label:BEGIN


INSERT INTO emprunt(Contenu_Code_Barre, Contenu_Numero_License,Abonne_numero,date_pret)
      SELECT contenuValCodeBarre,
            contenuValNumeroLicense,
            abonneValNumero,
            CURDATE()
            
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM emprunt
                  WHERE Contenu_Code_Barre=contenuValCodeBarre and 
                        Contenu_Numero_License=contenuValNumeroLicense and
                        date_retour IS NULL
                  LIMIT 1
            );


END;
$$


drop procedure if exists rendreContenu$$ 
CREATE PROCEDURE rendreContenu(IN contenuValCodeBarre INT, contenuValNumeroLicense INT)
# l'usager rend un contenu
rendreContenu_label:BEGIN


UPDATE emprunt set date_retour= CURDATE()
	  WHERE Contenu_Code_Barre=contenuValCodeBarre and 
			Contenu_Numero_License=contenuValNumeroLicense and
			date_retour IS NULL
	  LIMIT 1;
            


END;
$$


drop procedure if exists afficherDispo$$ 
CREATE PROCEDURE afficherDispo()
# l'usager veut connaitre les contenu disponibles
afficherDispo_label:BEGIN


SELECT * from contenu 

Where (Code_Barre,Numero_License) not in 


(SELECT Contenu_Code_Barre,Contenu_Numero_License 
from Emprunt 
where date_retour is null);


END;
$$


DELIMITER ;

#CALL emprunterContenu(20,0,12);
#CALL rendreContenu(0,60);
CALL afficherDispo();