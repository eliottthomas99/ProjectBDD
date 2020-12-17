use bibliotheque;

DELIMITER $$

DROP PROCEDURE IF EXISTS proc_retrait_abonne$$ 
CREATE PROCEDURE proc_retrait_abonne()
# Retire les abonne qui n ont pas renouvellé leur forfait au bout d un an
ECHEANCIER_LABEL:BEGIN
	DELETE FROM demande  
				WHERE (demande.Abonne_numero IN (
                select t.numero from(
                SELECT abonne.numero from abonne join demande on (abonne.numero=demande.Abonne_numero)
                where datediff(curdate(),abonne.dateAdhesion)>366) as t
                ));
                
                
                
	DELETE FROM emprunt  
				WHERE (emprunt.Abonne_numero IN (
                select t.numero from(
                SELECT abonne.numero from abonne join emprunt on (abonne.numero=emprunt.Abonne_numero)
                where datediff(curdate(),abonne.dateAdhesion)>366) as t
                ));
	DELETE FROM abonne  
				WHERE (abonne.numero IN (
                select t.numero from(
                SELECT abonne.numero from abonne
                where datediff(curdate(),abonne.dateAdhesion)>366) as t
                ));
END;
$$


/* E au dessus, J en dessous */


DELIMITER ;


DROP EVENT IF EXISTS retrait_abonne;
CREATE EVENT retrait_abonne
    ON SCHEDULE
      EVERY 1 MINUTE
    COMMENT 'Retire les abonne qui n ont pas renouvellé leur forfait au bout d un an'
    DO
      CALL proc_retrait_abonne();




/* E au dessus, J en dessous */
