USE bibliotheque;

DELIMITER $$

DROP PROCEDURE IF EXISTS afficherTout$$
CREATE PROCEDURE afficherTout()

AFFICHERTOUT_LABEL:BEGIN

SELECT Code_Barre,Numero_License,Titre,Support,codeCatalogue,
 (select count(*) from emprunt where Contenu_Code_Barre=Code_Barre and Contenu_Numero_License=Numero_License and date_retour is null) as emprunté
 
 FROM Contenu ; # l'usager veut savoir tous les contenu existant

END;
$$

DROP PROCEDURE IF EXISTS afficherNumerique$$
CREATE PROCEDURE afficherNumerique()

AFFICHERNUMERIQUE_LABEL:BEGIN

SELECT Code_Barre,Numero_License,Titre,Support ,codeCatalogue,
 (select count(*) from emprunt where Contenu_Code_Barre=Code_Barre and Contenu_Numero_License=Numero_License and date_retour is null) as emprunté
FROM Contenu
WHERE Type="numerique"; 
# l'usager veut savoir tous les contenu existant en numerique

END;
$$

DROP PROCEDURE IF EXISTS afficherPhysique$$
CREATE PROCEDURE afficherPhysique()

AFFICHERPHYSIQUE_LABEL:BEGIN

SELECT Code_Barre,Numero_License,Titre,Support,codeCatalogue,
 (select count(*) from emprunt where Contenu_Code_Barre=Code_Barre and Contenu_Numero_License=Numero_License and date_retour is null) as emprunté
FROM Contenu
WHERE type="physique"; 
# l'usager veut savoir tous les contenu existant en pysique

END;
$$




DROP PROCEDURE IF EXISTS afficherCorrespondanceArtiste$$ 
CREATE PROCEDURE afficherCorrespondanceArtiste(IN artisteValNom VARCHAR(45))
# l'usager veut savoir tous les contenu existant correspondant à un artiste en particulier
AFFICHERCORRESPONDANCEARTISTE_LABEL:BEGIN

SELECT Code_Barre,Numero_License,Titre,Support,Artiste.nom,Artiste.type,codeCatalogue,
 (select count(*) from emprunt where Contenu_Code_Barre=Code_Barre and Contenu_Numero_License=Numero_License and date_retour is null) as emprunté
FROM Contenu JOIN Participe 
ON Contenu.Code_Barre =Participe.Contenu_Code_Barre AND Contenu.Numero_License = Participe.Contenu_Numero_License
JOIN Artiste 
ON artiste.id=Participe.Artiste_id
WHERE Artiste.nom LIKE CONCAT("%",artisteValNom,"%");


END;
$$

DROP PROCEDURE IF EXISTS afficherCorrespondanceGenre$$ 
CREATE PROCEDURE afficherCorrespondanceGenre(IN genreValGenre VARCHAR(45))
# l'usager veut savoir tous les contenu existant correspondant à un genre en particulier
AFFICHERCORRESPONDANCEGENRE_LABEL:BEGIN

SELECT Code_Barre,Numero_License,Titre,Support,Genre.nom,codeCatalogue,
 (select count(*) from emprunt where Contenu_Code_Barre=Code_Barre and Contenu_Numero_License=Numero_License and date_retour is null) as emprunté
FROM Contenu JOIN Décrit 
ON Contenu.Code_Barre =Décrit.Contenu_Code_Barre AND Contenu.Numero_License = Décrit.Contenu_Numero_License
JOIN Genre 
ON genre.id=Décrit.Genre_id
WHERE Genre.nom LIKE CONCAT("%",genreValGenre,"%");


END;
$$


DROP PROCEDURE IF EXISTS afficherCorrespondanceEditeur$$ 
CREATE PROCEDURE afficherCorrespondanceEditeur(IN editeurValNom VARCHAR(45))
# l'usager veut savoir tous les contenu existant correspondant à un editeur en particulier
AFFICHERCORRESPONDANCEEDITEUR_LABEL:BEGIN

SELECT Code_Barre,Numero_License,Titre,Support,Editeur.nom,codeCatalogue,
 (select count(*) from emprunt where Contenu_Code_Barre=Code_Barre and Contenu_Numero_License=Numero_License and date_retour is null) as emprunté
FROM Contenu JOIN edite 
ON Contenu.Code_Barre =edite.Contenu_Code_Barre AND Contenu.Numero_License = edite.Contenu_Numero_License
JOIN Editeur 
ON Editeur.id=edite.Editeur_id
WHERE Editeur.nom LIKE CONCAT("%",editeurValNom,"%");


END;
$$


DROP PROCEDURE IF EXISTS afficherCorrespondanceEtablissement$$ 
CREATE PROCEDURE afficherCorrespondanceEtablissement(IN etablissementValNom VARCHAR(45))
# l'usager veut savoir tous les contenu existant correspondant à un etablissement en particulier
AFFICHERCORRESPONDANCEETABLISSEMENT_LABEL:BEGIN

SELECT Code_Barre,Numero_License,Titre,Support,Etablissement.nom,codeCatalogue,
 (select count(*) from emprunt where Contenu_Code_Barre=Code_Barre and Contenu_Numero_License=Numero_License and date_retour is null) as emprunté
FROM Contenu JOIN possede 
ON Contenu.Code_Barre =possede.Contenu_Code_Barre AND Contenu.Numero_License = possede.Contenu_Numero_License
JOIN Etablissement 
ON Etablissement.id=possede.Etablissement_id
WHERE Etablissement.nom LIKE CONCAT("%",etablissementValNom,"%");


END;
$$

DROP PROCEDURE IF EXISTS afficherCorrespondanceTitre$$ 
CREATE PROCEDURE afficherCorrespondanceTitre(IN contenuValTitre VARCHAR(45))
# l'usager veut savoir tous les contenu existant correspondant à un Titre en particulier
AFFICHERCORRESPONDANCETITRE_LABEL:BEGIN


SELECT Code_Barre,Numero_License,Titre,Support,codeCatalogue,
 (select count(*) from emprunt where Contenu_Code_Barre=Code_Barre and Contenu_Numero_License=Numero_License and date_retour is null) as emprunté
FROM Contenu 
WHERE Contenu.Titre LIKE CONCAT("%",contenuValTitre,"%");


END;
$$



############################################################################################################################

DROP PROCEDURE IF EXISTS afficherCorrespondanceMotCle$$ 
CREATE PROCEDURE afficherCorrespondanceMotCle(IN MotCle VARCHAR(45))
# l'usager veut savoir tous les contenu existant correspondant à un Mot Cle en particulier
AFFICHERCORRESPONDANCEMOTCLE:BEGIN

SELECT Code_Barre,Numero_License,Titre,Support,Etablissement.nom AS Etablissement, Genre.nom AS Genre, Artiste.nom AS Artiste, Artiste.type AS Role ,codeCatalogue,
 (select count(*) from emprunt where Contenu_Code_Barre=Code_Barre and Contenu_Numero_License=Numero_License and date_retour is null) as emprunté
FROM Contenu JOIN possede 
ON Contenu.Code_Barre =possede.Contenu_Code_Barre AND Contenu.Numero_License = possede.Contenu_Numero_License
JOIN Etablissement 
ON Etablissement.id=possede.Etablissement_id

JOIN Décrit 
ON Contenu.Code_Barre =Décrit.Contenu_Code_Barre AND Contenu.Numero_License = Décrit.Contenu_Numero_License
JOIN Genre 
ON genre.id=Décrit.Genre_id
JOIN Participe 
ON Contenu.Code_Barre =Participe.Contenu_Code_Barre AND Contenu.Numero_License = Participe.Contenu_Numero_License
JOIN Artiste 
ON artiste.id=Participe.Artiste_id

WHERE Etablissement.nom LIKE CONCAT("%",MotCle,"%")OR
      Genre.nom LIKE CONCAT("%",MotCle,"%") OR
      Artiste.nom LIKE CONCAT("%",MotCle,"%") OR
      Contenu.Titre LIKE CONCAT("%",MotCle,"%");


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

DROP PROCEDURE IF EXISTS afficherEmprunt$$ 
CREATE PROCEDURE afficherEmprunt()
# l'usager veut connaitre les contenu disponibles
AFFICHEREMPRUNT_LABEL:BEGIN


SELECT * FROM contenu 

WHERE (Code_Barre,Numero_License) IN 


(SELECT Contenu_Code_Barre,Contenu_Numero_License 
FROM Emprunt 
WHERE date_retour IS NULL);


END;
$$













CALL afficherTout();
#CALL afficherNumerique();
#CALL afficherPhysique();
#CALL afficherCorrespondanceArtiste("Stendhal");
#CALL afficherCorrespondanceGenre("science fiction");
#CALL afficherCorrespondanceEditeur("Gallimard");
#CALL afficherCorrespondanceEtablissement("ENSSAT");
#CALL afficherCorrespondanceMotCle("star wars");
#CALL afficherCorrespondanceTitre("st");
#CALL afficherEmprunt();
