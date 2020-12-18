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
#CALL ajoutLienEdite("Seyes", 0, 152); #On dit que le contenu (0,152) est co edite avec Seyes -> Fonctionne cette fois car cree Seyes en tant qu editeur avant de le lier au contenu

# CAS 20 : TEST procedure ajoutParticipe
#CALL ajoutParticipe("Julien THOMAS","ecrivain",0,152); #On dit que le contenu (0,152) est co ecrit avec Julien THOMAS -> ne fonctionne pas car Julien THOMAS n'est pas dans les artistes 

# CAS 21 : TEST procedure ajoutLienParticipe
#CALL ajoutLienParticipe("Julien THOMAS","ecrivain", 0, 152); #On dit que le contenu (0,152) est co ecrit avec Julien THOMAS -> fonctionne car on ajoute Julien THOMAS dans les artistes avant de le lier au contenu

# CAS 22 : TEST procedure ajoutPossede
#CALL ajoutPossede("Warp Zone",0,152); #On dit que le contenu (0,152) appartient également à Warp Zone -> ne fonctionne pas car WarpZone n'a pas été créé

# CAS 23 : TEST procedure ajoutLienPossede
#CALL ajoutLienPossede("Warp Zone", 0, 152); #On dit que le contenu (0,200) est également possédé -> fonctionne car on cree Warp Zone avant de le lier au contenu

# CAS 24 : TEST procedure ajoutGenre
#CALL ajoutGenre("comedie musicale"); #On crée un nouveau genre

# CAS 25 : TEST procedure ajoutLivre
#CALL ajoutLivre(180,"Le Seigneur des anneaux",135,"J. R. R. Tolkien","fantastique","Folio junior","Nokia"); #On ajoute le seigneur des anneaux chez Nokia

# CAS 26 : TEST procedure ajoutEtablissement
#CALL ajoutEtablissement("mediatheque de Lannion"); #On ajoute la "mediatheque de Lannion" aux etablissements

# CAS 27 : TEST procedure ajoutEFilm
#CALL ajoutEFilm(200,"Le Hobbit",200,"Peter Jackson","Peter Jackson","fantastique","IUT"); #On ajoute le Hobbit au format numérique pour l'IUT

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


/*
# CAS 29 : echancier
# affiche tous les contenus empruntes qui sont en retard et l abonne qui les a empruntes
# les 3 contenus suivant ne sont pas en retard donc ils ne seront pas affiches
CALL emprunterContenu(0,1,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,2,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,3,1); # l abonne emprunte un contenu
# on ajoutes des contenus qui sont en retard
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '4', '2', '2020-01-01', '0'); # l abonne 2 a emprunte le contenu de code license 4 le 1er janvier 2020, il est donc en retard
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '5', '2', '2020-01-01', '0'); # l abonne 2 a emprunte le contenu de code license 5 le 1er janvier 2020, il est donc en retard
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '6', '3', '2020-01-01', '0'); # l abonne 3 a emprunte le contenu de code license 6 le 1er janvier 2020, il est donc en retard
# le resultat attendu est l abonne 2 a 2 retard pour le contenu 4 et 5, et l abonne 3 a un retard sur le contenu 6
CALL echeancier();
*/



/*
# CAS 30 : contenuPopulaire
CALL emprunterContenu(0,1,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,2,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,3,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,4,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,5,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,6,2); # l abonne emprunte un contenu
CALL emprunterContenu(0,7,2); # l abonne emprunte un contenu
CALL emprunterContenu(0,8,2); # l abonne emprunte un contenu
CALL emprunterContenu(0,9,2); # l abonne emprunte un contenu
CALL emprunterContenu(0,10,2); # l abonne emprunte un contenu
CALL contenuPopulaire(3); # affiche les n (ici 3) contenus totalisant le plus d emprunts
*/


/*
# CAS 31 : empruntCount
# affiche le nombre d emprunts de contenu en cours par etablissement
CALL emprunterContenu(0,1,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,2,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,3,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,4,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,5,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,6,2); # l abonne emprunte un contenu
CALL emprunterContenu(0,7,2); # l abonne emprunte un contenu
CALL emprunterContenu(0,8,2); # l abonne emprunte un contenu
CALL emprunterContenu(0,9,2); # l abonne emprunte un contenu
CALL emprunterContenu(0,10,2); # l abonne emprunte un contenu
CALL empruntCount(); # on voit qu il a bien 10 emprunt en cours reparti dans differents etablissements
*/


/*
# CAS 32 : clientEmpruntantCount
# Compte tous les clients distincts ayant au moins un emprunt en cours
CALL emprunterContenu(0,1,1); # l abonne 1 a 2 emprunts en cours
CALL emprunterContenu(0,2,1);
CALL emprunterContenu(0,3,2); # l abonne 2 a 1 emprunts en cours
CALL emprunterContenu(0,4,3);
CALL rendreContenu(0,4); # l abonne 3 a 0 emprunts en cours car il a rendu son emprunt
# Ici la reponse attendu est 2
CALL clientEmpruntantCount;
*/


/*
# CAS 33 : emprunterContenu
# On souhaite emprunter un contenu
# SELECT * FROM bibliotheque.emprunt; # On regarde les emprunts en cours
CALL emprunterContenu(0,5,1); # l abonne emprunte un exemplaire de star wars episode 3
# SELECT * FROM bibliotheque.emprunt; # On verifie que notre enprunt a bien ete pris en compte
*/


/*
# CAS 33* : emprunterContenu
# On souhaite emprunter un contenu qui est deja emprunte
# SELECT * FROM bibliotheque.emprunt; # On regarde les emprunts en cours
CALL emprunterContenu(0,5,1); # l abonne 1 emprunte un exemplaire de star wars episode 3
CALL emprunterContenu(0,5,2); # l abonne 2 souhaite emprunter un exemplaire de star wars episode 3 qui est deja emprunte
# SELECT * FROM bibliotheque.emprunt; # L emprunt de l abonne 2 n a pas ete enregistre
*/


/*
# CAS 33** : emprunterContenu
# On souhaite emprunter un contenu qui est disponible mais qui est "mis de cote" par quelqu un d autre
# SELECT * FROM bibliotheque.emprunt; # On regarde les emprunts en cours
CALL emprunterContenu(0,4,1); # l abonne 1 emprunte l unique exemplaire de star wars episode 2
CALL reserverContenuEmprunte(2,3); # l abonne 3 reserve tous les contenus de code catalogue 2 (star wars episode 2)
call rendreContenu(0,4); # l abonne 1 rend star wars episode 2, le contenu est de nouveau disponible
CALL emprunterContenu(0,4,2); # l abonne 2 souhaite emprunter un exemplaire de star wars episode  qui est disponible
# SELECT * FROM bibliotheque.emprunt; # L emprunt de l abonne 2 a echoue car le contenu est mis de cote et qu il ne l a pas reserve
*/


/*
# CAS 33*** : emprunterContenu
# On souhaite emprunter un contenu qui est disponible mais qui est "mis de cote" 
# SELECT * FROM bibliotheque.emprunt; # On regarde les emprunts en cours
CALL emprunterContenu(0,4,1); # l abonne 1 emprunte l unique exemplaire de star wars episode 2
CALL reserverContenuEmprunte(2,3); # l abonne 3 reserve tous les contenus de code catalogue 2 (star wars episode 2)
CALL rendreContenu(0,4); # l abonne 1 rend star wars episode 2, le contenu est de nouveau disponible
SELECT * FROM bibliotheque.emprunt; # On voit qu il y a un emprunt en cours
SELECT * FROM bibliotheque.demande; # On voit qu il y a une demande en cours
CALL emprunterContenu(0,4,3); # l abonne 3 souhaite emprunter un exemplaire de star wars episode  qui est disponible
SELECT * FROM bibliotheque.emprunt; # L emprunt de l abone 3 s est realise car il avait fait une reservation (le contenu etait "mis de cote")
SELECT * FROM bibliotheque.demande; # l emprunt a ete retire des demandes car le contenu a ete reserve
*/


/*
# CAS 33**** : emprunterContenu
# On souhaite emprunter  plein de contenus mais il y a une limite a 5
# SELECT * FROM bibliotheque.emprunt; # On regarde les emprunts en cours
CALL emprunterContenu(0,1,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,2,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,3,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,4,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,5,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,6,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,7,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,8,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,9,1); # l abonne emprunte un contenu
CALL emprunterContenu(0,10,1); # l abonne emprunte un contenu
# SELECT * FROM bibliotheque.emprunt; # On vois que seul les 5 premiers emprunts on ete pris en compte
*/


/*
# CAS 33***** : emprunterContenu
# On souhaite emprunter un contenu
# SELECT * FROM bibliotheque.emprunt; # On regarde les emprunts en cours
UPDATE `bibliotheque`.`abonne` SET `penalite` = '10' WHERE (`numero` = '1'); # l abonne 1 a une penalite trop elevee pour emprunter
CALL emprunterContenu(0,5,1); # l abonne emprunte un exemplaire de star wars episode 3
# SELECT * FROM bibliotheque.emprunt; # L emprunt ne s est pas fait a cause du niveau de penalite de l abonnee

# UPDATE `bibliotheque`.`abonne` SET `penalite` = '0' WHERE (`numero` = '1'); # !! attention a bien remettre la penalite a 0 pour ne pas perturber les autres tests
*/


/*
# CAS 34 : nombreEmprunt
# procedure ayant pour but de faire des statistique, affiche le nombre total d emprunts qu a fait un abonne depuis son adhesion
# CALL nombreEmprunt(1); # affiche le nombre total d emprunt de l abonne 1
CALL emprunterContenu(0,2,1);
CALL emprunterContenu(0,4,1);
CALL emprunterContenu(0,5,1);
# CALL nombreEmprunt(1); # affiche 3 de plus que tout a l heure car on a emprunte 3 contenus en plus
*/


/*
# CAS 35 : payerPenalite
# permet de faire baisser la penalite d un abonne
# SELECT * FROM abonne WHERE numero = 1;
CALL payerPenalite(1337, 1); # l abonne 1 rajoute 1337 "credits" sur son compte, il pourra se permettre de rendre des contenus en retard
# SELECT * FROM abonne WHERE numero = 1;
*/


/*
# CAS 35* : payerPenalite
# Si l abonne n existe pas alors rien ne se passe
# SELECT * FROM abonne WHERE numero = 1000;
CALL payerPenalite(1337, 1000); # l abonne 1000n existe pas
# SELECT * FROM abonne WHERE numero = 1000;
*/


/*
# CAS 36 proc_retrait_abonne
# retire tous les abonnes qui sont inscrit depuis plus d un an
CALL ajoutAbonne("MANSON","Marilyn", "mmanson@enssat.fr"); # On ajoute un personne qui est membre depuis moins de  an, donc a ne pas retirer
INSERT INTO `bibliotheque`.`abonne` (`numero`, `nom`, `prenom`, `adresse`, `dateAdhesion`, `penalite`) VALUES ('100', 'COBAIN', 'Kurt', 'kcobain@enssat.fr', '2018-01-01', '0'); # On ajoute un abonne qui s est abonne en 2018, il a plus d un an, il faut donc le retirer
CALL proc_retrait_abonne();
*/


/*
# CAS 37 : renouvelerAbonnement
# Si l'abonne n existe pas
CALL renouvelerAbonnement(30); # Il n'existe pas d'abonne avec le numero 30 alors il ne se passe rien
*/


/*
# CAS 37* : renouvelerAbonnement
# Si l'abonne existe et si sa date d abonnement est plus ancienne que la date du jour
UPDATE `bibliotheque`.`abonne` SET `dateAdhesion` = '2020-12-01' WHERE (`numero` = '1'); # On change la date d abonnement d un abonne pour pouvoir la mettre a jour
CALL renouvelerAbonnement(1); # La date d abonnement de l'abonne est mise a jour avec la date du jour
*/


/*
# CAS 38 : rendreContenu
CALL rendreContenu(0,6); # Si on essaie de rendre un contenu qui n est pas emprunte alors rien ne se passe
*/


/*
# CAS 38* : rendreContenu
CALL emprunterContenu(0,6,1); # On emprunte le contenu pour pouvoir le rendre
CALL rendreContenu(0,6); # L emprunt est bien mis a jour et considere comme termine, le contenu est de nouveau disponible
*/


/*
# CAS 38** : rendreContenu
# Si on rend en retard on a une penalite
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '6', '1', '2020-10-01', '0'); # On fait un emprunt qui nous fait depasser la date limite de rendu
CALL rendreContenu(0,6); # L emprunt est bien mis a jour et considere comme termine, le contenu est de nouveau disponible ET l abonne a une penalite
*/


/*
# CAS 39 : renouvelerEmprunt
# On renouvel un emprunt que si il est deja emprunte
CALL renouvelerEmprunt(0,6); # rien ne se passe, le contenu n est pas emprunte, il ne peut pas etre renouvele
*/


/*
# CAS 39* : renouvelerEmprunt
# On renouvel un emprunt que si il est deja emprunte
CALL emprunterContenu(0,6,1); # On emprunte le contenu pour pouvoir renouveler l emprunt
CALL renouvelerEmprunt(0,6); # l emprunt est renouvele
*/


/*
# CAS 39** : renouvelerEmprunt
# On renouvel un emprunt que si l abonne n est pas en retard par rapport a la date buttoire de rendu
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '6', '1', '2020-11-01', '0'); # Le contenu de numero de license 6 a ete emprunte il a plus que 7 jours (7 jours car ce n est ni un livre ni un ebook, ca serait 15 jours dans ce cas la)
CALL renouvelerEmprunt(0,6); # on ne renouvel pas car l abonne est en retard pour le rendu
*/


/*
# CAS 39*** : renouvelerEmprunt
# On renouvel un emprunt que si l abonne n est pas depasse la limite de 3 renouvellement
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '6', '1', '2020-11-24', '3'); # Le contenu de numero de license 6 a ete emprunte il a au mini 21 jours et au plus 28 jours /!\ ATTENTION /!\ ajuster la date si besoin !
CALL renouvelerEmprunt(0,6); # on ne renouvel pas car l abonne a atteint la limite de renouvellements
*/


/*
# CAS 39**** : renouvelerEmprunt
# On renouvel un emprunt que si l abonne n est pas depasse la limite de 3 renouvellement
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '6', '1', '2020-12-01', '2'); # Le contenu de numero de license 6 a ete emprunte il a au mini 14 jours et au plus 21 jours /!\ ATTENTION /!\ ajuster la date si besoin !
CALL renouvelerEmprunt(0,6); # On renouvele car ici on n est qu a 2 renouvelements et qu on est dans la bonne fourchette de temps pour le faire !! voir le rapport pour plus de precision !!
*/


/*
# CAS 39***** : renouvelerEmprunt
# On ne peut pas faire 2 renouvellement de suite, on doit attendre d etre dans le dernier crenau pour pouvoir renouveler l emprunt !! voir le rapport pour plus d infos !!
CALL emprunterContenu(0,6,1); # On emprunte le contenu pour pouvoir renouveler l emprunt
CALL renouvelerEmprunt(0,6); # l emprunt est renouvele
CALL renouvelerEmprunt(0,6); # l emprunt n est pas renouvele car on n est pas dans la bonne fourchette de temps pour le faire !! voir le rapport pour plus de precision !!
*/



# CAS 40 : reserverContenuEmprunte
# On essaie de reserver un contenu qui est dispo
# On reserve tous les star wars episode 3
# SELECT * FROM bibliotheque.demande; # pas encore de demande
 #CALL reserverContenuEmprunte(3, 1);
# SELECT * FROM bibliotheque.demande; # pas de demande enregistre



/*
# CAS 40* : reserverContenuEmprunte
# On reserve tous les contenus qui ont le meme code catalogue si aucun des contenu avec ce code catalogue n est dispo
# On reserve tous les star wars episode 3
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '5', '1', '2020-10-15', '0'); # On reserve le contenu de numero de license 5 mais on ne le rend pas encore
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '6', '2', '2020-10-15', '0'); # On reserve le contenu de numero de license 6 mais on ne le rend pas encore
# On fait une demande sur star wars episode 3
# SELECT * FROM bibliotheque.demande; # pas encore de demande
CALL reserverContenuEmprunte(3, 8);
# SELECT * FROM bibliotheque.demande; # demande ok
*/


/*
# CAS 40** : reserverContenuEmprunte
# On reserve tous les contenus qui ont le meme code catalogue si aucun des contenu avec ce code catalogue n est dispo
# On reserve tous les star wars episode 3
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `date_retour`, `renouvellement`) VALUES ('0', '5', '1', '2020-10-01', '2020-12-15', '0'); # On reserve le contenu de numero de license 5 mais on e rend
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '6', '2', '2020-10-15', '0'); # On reserve le contenu de numero de license 6 mais on ne le rend pas encore
# On fait une demande sur star wars episode 3
# SELECT * FROM bibliotheque.demande; # pas encore de demande
CALL reserverContenuEmprunte(3, 8);
# SELECT * FROM bibliotheque.demande; # demande ok
*/



# CAS 40*** : reserverContenuEmprunte
# On reserve tous les contenus qui ont le meme code catalogue si aucun des contenu avec ce code catalogue n est dispo 
# On reserve tous les star wars episode 3
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '5', '1', '2020-10-15', '0'); # On reserve le contenu de numero de license 5 mais on ne le rend pas encore
INSERT INTO `bibliotheque`.`emprunt` (`Contenu_Code_Barre`, `Contenu_Numero_License`, `Abonne_numero`, `date_pret`, `renouvellement`) VALUES ('0', '6', '2', '2020-10-15', '0'); # On reserve le contenu de numero de license 6 mais on ne le rend pas encore
# on met une penalite a notre abonne l empechant de faire des demandes et des emprunts
UPDATE `bibliotheque`.`abonne` SET `penalite` = '1337' WHERE (`numero` = '8'); # On modifie la penalite de l abonne de maniere a ce qu il ne puisse pas faire d emprunts ni de reservation
# On fait une demande sur star wars episode 3
# SELECT * FROM bibliotheque.demande; # pas encore de demande
CALL reserverContenuEmprunte(3, 8);
# SELECT * FROM bibliotheque.demande; # pas de demande enregistre



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