use bibliotheque;

# CAS 0 : TEST procedure afficherTout
# CALL afficherTout(); #Un ulilisateur regarde les tous contenus proposés

# CAS 1 : TEST procedure afficherPhysique
# CALL afficherPhysique(); #Un ulilisateur regarde les contenus proposés en physique

# CAS 2 : TEST procedure afficherNumerique
# CALL afficherNumerique(); #Un ulilisateur regarde les contenus proposés en numerique

# CAS 3 : TEST procedure afficherEmprunt
# CALL afficherEmprunt(); #Un ulilisateur regarde les contenus empruntes

# CAS 4 : TEST procedure afficherDispo
# CALL afficherDispo(); #Un ulilisateur regarde les contenus disponibles

# CAS 5 : TEST procedure afficherCorrespondanceTitre
# CALL afficherCorrespondanceTitre("Star Wars"); #Un ulilisateur regarde les contenus dont le titre contient "star wars"

# CAS 6 : TEST procedure afficherCorrespondanceGenre
# CALL afficherCorrespondanceGenre("aventure"); #Un ulilisateur regarde les contenus dans le genre "aventure"

# CAS 7 : TEST procedure afficherCorrespondanceEtablissement
# CALL afficherCorrespondanceEtablissement("ENSSAT"); #Un ulilisateur regarde les contenus appartenant à l ENSSAT

# CAS 8 : TEST procedure afficherCorrespondanceEditeur
# CALL afficherCorrespondanceEditeur("Gallimard"); #Un ulilisateur regarde les livres édités chez Gallimard

# CAS 9 : TEST procedure afficherCorrespondanceArtiste
# CALL afficherCorrespondanceArtiste("George Lucas"); #Un ulilisateur regarde les contenus où George Lucas a participéalter

# CAS 10 : TEST procedure afficherCorrespondanceMotCle
# CALL afficherCorrespondanceMotCle("Star"); #Un ulilisateur regarde les contenus en "rapport" avec le mot cle "Star"

# CAS 11 : TEST procedure ajoutAbonne
#CALL ajoutAbonne("VADOR","Dark","dvador@orange.fr"); #On ajoute Dark VADOR en tant qu abonne

# CAS 12 : TEST procedure ajoutArtiste
#CALL ajoutArtiste('Eric THOMAS', 'guitariste'); #On ajoute Eric THOMAS en tant qu artiste











/*
#CAS12 : TEST procédure emprunterContenu
CALL emprunterContenu(72,0,38); #l'abonne 38 souhaite emprunter un contenu et il est libre
#CALL afficherTout(); #on regarde si la colonne emprunte est passé à 1 pour le contenu (72,0)
*/



/*
#CAS2 : l'utilisateur souhaite emprunter un contenu et il n'est pas libre.
CALL emprunterContenu(108,0,38); # L'abonne 38 emprunte le seul exemplaire de Back in black
CALL emprunterContenu(108,0,39); #  pour l'abonne 39 : l'emprunt echoue
CALL reserverContenuEmprunte(41,39); #l'abonne réserve le contenu. Sa demande porte sur le CodeCatalogue. 
*/


#################################################





# CAS 40 : reserverContenuEmprunte
# On essaie de reserver un contenu qui est dispo
# On reserve tous les star wars episode 3
# SELECT * FROM bibliotheque.demande; # pas encore de demande
CALL reserverContenuEmprunte(3, 40);
# SELECT * FROM bibliotheque.demande; # pas de demande enregistre


/*
# CAS 40* : reserverContenuEmprunte
# On reserve tous les contenus qui ont le meme code catalogue si aucun des contenu avec ce code catalogue n est dispo
# On reserve tous les star wars episode 3
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '5', '38', '2020-10-15', '0');
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '6', '39', '2020-10-15', '0');
# On fait une demande sur star wars episode 3
# SELECT * FROM bibliotheque.demande; # pas encore de demande
CALL reserverContenuEmprunte(3, 40);
# SELECT * FROM bibliotheque.demande; # demande ok
*/


/*
# CAS 40** : reserverContenuEmprunte
# On reserve tous les contenus qui ont le meme code catalogue si aucun des contenu avec ce code catalogue n est dispo 
# On reserve tous les star wars episode 3
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '5', '38', '2020-10-15', '0');
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '6', '39', '2020-10-15', '0');
# on met une penalite a notre abonne l empechant de faire des demandes et des emprunts
# On fait une demande sur star wars episode 3
# SELECT * FROM bibliotheque.demande; # pas encore de demande
CALL reserverContenuEmprunte(3, 40);
# SELECT * FROM bibliotheque.demande; # pas de demande enregistre
*/


# CAS 41 : supportPopulaire
# Affiche le nombre total de fois d emprunts par support
# CALL supportPopulaire(1); # prend en parametre les N supports les plus populaire a afficher


/*
# CAS 42 : supprimerDemandesDepassees
# Tous les star wars episode 3 sont empruntés, celui de code barre 5 a ete rendu il y a plus que 7 jours
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `date_retour`, `renouvellement`) VALUES ('0', '5', '38', '2020-10-15', '2020-12-01', '0');
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '6', '39', '2020-10-15', '0');
# Une reservation est faite pour tous les star wars episode 3
INSERT INTO `bibliotheque`.`demande` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_demande`) VALUES ('0', '5', '40', '2020-11-30');
INSERT INTO `bibliotheque`.`demande` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_demande`) VALUES ('0', '6', '40', '2020-11-30');
# On supprime toutes les demandes qui datent d il y a plus de 7 jours
# SELECT * FROM bibliotheque.demande; # Les demandes sont presentes
CALL supprimerDemandesDepassees();
# SELECT * FROM bibliotheque.demande; # les demandes ont ete supprimees
*/