use bibliotheque;

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


