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

DROP PROCEDURE IF EXISTS supprimerDemandesDepassees$$ 
CREATE PROCEDURE supprimerDemandesDepassees()
# supprime toutes les demandes concernant un code catalogue qui a ete retourne il y plus de 7 jours
supprimerDemandesDepassees:BEGIN
/*
	SET @codeCatalogueRetourPlusDe7j = (SELECT DISTINCT codeCatalogue FROM contenu
										JOIN emprunt 
											ON Contenu.Code_Barre = emprunt.Contenu_Code_Barre AND Contenu.Numero_License = emprunt.Contenu_Numero_License
										WHERE date_retour IS NOT NULL
                                        ORDER BY date_retour DESC); */
										
	#DELETE FROM demande WHERE ((Contenu_Code_Barre, Contenu_Numero_License) IN (SELECT Code_Barre,Numero_License FROM contenu WHERE codeCatalogue = @codeCatalogue)) AND Abonne_numero = abonneValNumero;
	
DELETE FROM demande
WHERE (Contenu_Code_Barre, Contenu_Numero_License) IN (# retourne les code_barre et numero_license des demandes a supprimer
														SELECT DISTINCT Code_Barre, Numero_License FROM contenu
																							JOIN emprunt 
																								ON Contenu.Code_Barre = emprunt.Contenu_Code_Barre AND Contenu.Numero_License = emprunt.Contenu_Numero_License
																							# On regarde si le code catalogue fait parti des codes catalogues dispo a l emprunt
																							WHERE codeCatalogue IN (SELECT codeCatalogue FROM contenu AS contenu1
																																			JOIN emprunt AS emprunt1
																																				ON contenu1.Code_Barre = emprunt1.Contenu_Code_Barre AND Contenu1.Numero_License = emprunt1.Contenu_Numero_License
																																		# On regarde si l emprunt le plus recent est suivi d un rendu
																																		WHERE date_pret = ( SELECT MAX(date_pret) FROM (contenu AS contenu2
																																													JOIN emprunt AS emprunt2
																																														ON Contenu2.Code_Barre = emprunt2.Contenu_Code_Barre AND Contenu2.Numero_License = emprunt2.Contenu_Numero_License)
																																													WHERE Contenu1.Code_Barre = Contenu2.Code_Barre AND Contenu1.Numero_License = Contenu2.Numero_License)
																																		AND date_retour IS NOT NULL AND DATEDIFF(CURDATE(),date_retour) > 7)
                                                                                
                                                                                );



END;
$$

DELIMITER ;


DROP EVENT IF EXISTS retrait_abonne;
CREATE EVENT retrait_abonne
    ON SCHEDULE
      EVERY 1 MINUTE
    COMMENT 'Retire les abonne qui n ont pas renouvellé leur forfait au bout d un an'
    DO
      CALL proc_retrait_abonne();



DROP EVENT IF EXISTS meangeDemandeDepassees;
CREATE EVENT meangeDemandeDepassees
    ON SCHEDULE
      EVERY 1 MINUTE
    COMMENT 'Clears out demande depassees each hour.'
    DO
      CALL supprimerDemandesDepassees();



/* E au dessus, J en dessous */
