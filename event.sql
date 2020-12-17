use bibliotheque;

DELIMITER $$



/* E au dessus, J en dessous */


DELIMITER ;


DROP EVENT IF EXISTS e_hourly;
CREATE EVENT e_hourly
    ON SCHEDULE
      EVERY 1 MINUTE
    COMMENT 'Clears out sessions table each hour.'
    DO
      DELETE FROM `bibliotheque`.`possede` WHERE (`Contenu_Code_Barre` = '0000000040') and (`Contenu_Numero_License` = '0000000000') and (`Etablissement_id` = '7');



/* E au dessus, J en dessous */
