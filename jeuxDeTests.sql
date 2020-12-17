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

# CAS 13 : TEST procedure ajoutContenu
#CALL ajoutContenu(150,0,"La formule du savoir","physique","livre",135,"IFSI","philosophie"); #On ajoute un Contenu (ici un livre) à l'IFSI
#CALL ajoutLienParticipe("Lê Nguyen Hoang","ecrivain",150,0); #On precise le ou les artistes de cette manière

# CAS 14 : TEST procedure ajoutDecrit
#CALL ajoutDecrit("science",150,0 ); #On indique que le contenu (150,0) est également scientifique -> Ne fonctionne pas car "science" n'a pas été ajouté comme genre

# CAS 15 : TEST procedure ajoutLienDecrit
#CALL ajoutLienDecrit("science", 150, 0); #On ajoute au contenu (150,0) le genre "science" -> fonctionne car on a cette fois ci créé le genre "science" avant de l'ajouter

# CAS 16 : TEST procedure ajoutDVD
#CALL ajoutDVD(151,"Imitation Game",160,"Morten Tyldum","Ampersand Pictures","biographie","IUT"); #On ajoute un DVD à l IUT

# CAS 17 : TEST procedure ajoutEBook
#CALL ajoutEBook(152,"Eragon",113,"Chistopher Paolini","fantastique","Bayard Jeunesse","IFSI"); #On ajoute un ebook à l IFSI

# CAS 18 : TEST procedure ajoutEdite
#CALL ajoutEdite("Seyes",0,152); #On dit que le contenu (0,152) est co edite avec Seyes -> Ne fonctionne pas car "seyes" na pas ete cree comme editeur

# CAS 19 : TEST procedure ajoutLienEdite
CALL ajoutLienEdite("Seyes", 0, 152); #On dit que le contenu (0,152) est co edite avec Seyes -> Fonctionne cette fois car cree Seyes en tant qu editeur avant de le lier au contenu

# CAS 18 : TEST procedure ajoutParticipe
#CALL ajoutParticipe("Julien THOMAS",0,152); #On dit que le contenu (0,152) est co ecrit avec Julien THOMAS

# CAS 19 : TEST procedure ajoutPossede
#CALL ajoutPossede("ENSSAT",0,152); #On dit que le contenu (0,152) appartient également à l'ENSSAT

# CAS 20 : TEST procedure ajoutGenre
#CALL ajoutGenre("comedie musicale"); #On crée un nouveau genre

# CAS 21 : TEST procedure ajoutLivre
#CALL ajoutLivre(180,"Le Seigneur des anneaux",135,"J. R. R. Tolkien","fantastique","Folio junior","Nokia"); #On ajoute le seigneur des anneaux chez Nokia

# CAS 22 : TEST procedure ajoutEtablissement
#CALL ajoutEtablissement("mediatheque de Lannion"); #On ajoute la "mediatheque de Lannion" aux etablissements

# CAS 23 : TEST procedure ajoutEFilm
#CALL ajoutEFilm(200,"Le Hobbit",200,"Peter Jackson","Peter Jackson","fantastique","IUT"); #On ajoute le Hobbit au format numérique pour l'IUT



# CAS 25 : TEST procedure ajoutLienEdite
#CALL ajoutLienEdite("Gallimard", 180, 0); #On ajoute au contenu (180,0) l'éditeur "Gallimard"

# CAS 26 : TEST procedure ajoutLienParticipe
#CALL ajoutLienParticipe("J. R. R. Tolkien","auteur", 0, 200); #On ajoute au contenu (0,200) l auteur J R R Tolkien

# CAS 27 : TEST procedure ajoutLienPossede
#CALL ajoutLienPossede("IUT", 0, 200); #On dit que le contenu (0,200) est également possédé



# CAS 28 : TEST procedure ajoutEditeur
#CALL ajoutEditeur("Larousse"); #On ajoute l editeur "Larousse"











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
# CALL reserverContenuEmprunte(3, 1);
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
# Tous les star wars episode 3 sont empruntes (il y en a 2, celui de numero license 5 et celui de numero license 6), celui de numero license 5 a ete rendu il y a plus que 7 jours
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `date_retour`, `renouvellement`) VALUES ('0', '5', '1', '2020-10-15', '2020-12-01', '0'); # On creer un emprunt pour le contenu de numero license 5 et qui a ete rendu il y a plus (+) de 7 jours
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '6', '2', '2020-10-15', '0'); # On creer un emprunt pour le contenu de numero license 6 mais il n a pas encore ete rendu
# Tous les exemplaires du Banquet de Platon sont empruntes mais celui de code barre 33 a ete retourne il y a moins de 7 jours (mettre a jour la date manuellement au besoin)
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `date_retour`, `renouvellement`) VALUES ('33', '0', '1', '2020-10-15', '2020-12-17', '0'); # On creer un emprunt pour le contenu de numero license 33 et qui a ete rendu il y a moins de 7 jours (mettre a jours la date manuellement au besoin)

# Une reservation est faite pour tous les star wars episode 3
INSERT INTO `bibliotheque`.`demande` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_demande`) VALUES ('0', '5', '3', '2020-11-30'); # On fait une demande sur le contenu de numero license 5
INSERT INTO `bibliotheque`.`demande` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_demande`) VALUES ('0', '6', '3', '2020-11-30'); # On fait une demande sur le contenu de numero license 6
# Une reservation est faite pour tous les exemplaires du Banquet
INSERT INTO `bibliotheque`.`demande` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_demande`) VALUES ('33', '0', '3', '2020-11-30'); # On fait une demande sur le contenu de numero license 33

# On supprime toutes les demandes qui datent d il y a plus de 7 jours
# SELECT * FROM bibliotheque.demande; # Toutes les demandes sont presentes
CALL supprimerDemandesDepassees(); # il y a une demande a supprimer, un exemplaire star wars episode 3 a ete rendu il y a plus de 7 jours
# SELECT * FROM bibliotheque.demande; # les demandes concernant star wars episode 3 ont ete supprimees
*/