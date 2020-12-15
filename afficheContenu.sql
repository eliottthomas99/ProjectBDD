use bibliotheque;

DELIMITER $$

drop procedure if exists afficherTout$$
CREATE PROCEDURE afficherTout()

afficherTout_label:BEGIN

select Code_Barre,Numero_License,Titre,Support from Contenu; # l'usager veut savoir tous les contenu existant

END;
$$

drop procedure if exists afficherNumerique$$
CREATE PROCEDURE afficherNumerique()

afficherNumerique_label:BEGIN

select Code_Barre,Numero_License,Titre,Support 
from Contenu
where Type="numerique"; 
# l'usager veut savoir tous les contenu existant en numerique

END;
$$

drop procedure if exists afficherPhysique$$
CREATE PROCEDURE afficherPhysique()

afficherPhysique_label:BEGIN

select Code_Barre,Numero_License,Titre,Support 
from Contenu
where type="physique"; 
# l'usager veut savoir tous les contenu existant en pysique

END;
$$




drop procedure if exists afficherCorrespondanceArtiste$$ 
CREATE PROCEDURE afficherCorrespondanceArtiste(IN artisteValNom varchar(45))
# l'usager veut savoir tous les contenu existant correspondant à un artiste en particulier
afficherCorrespondanceArtiste_label:BEGIN

select Code_Barre,Numero_License,Titre,Support,Artiste.nom,Artiste.type
from Contenu join Participe 
on Contenu.Code_Barre =Participe.Contenu_Code_Barre and Contenu.Numero_License = Participe.Contenu_Numero_License
join Artiste 
on artiste.id=Participe.Artiste_id
where Artiste.nom=artisteValNom;


END;
$$

drop procedure if exists afficherCorrespondanceGenre$$ 
CREATE PROCEDURE afficherCorrespondanceGenre(IN genreValGenre varchar(45))
# l'usager veut savoir tous les contenu existant correspondant à un genre en particulier
afficherCorrespondanceGenre_label:BEGIN

select Code_Barre,Numero_License,Titre,Support,Genre.nom
from Contenu join Décrit 
on Contenu.Code_Barre =Décrit.Contenu_Code_Barre and Contenu.Numero_License = Décrit.Contenu_Numero_License
join Genre 
on genre.id=Décrit.Genre_id
where Genre.nom=genreValGenre;


END;
$$


drop procedure if exists afficherCorrespondanceEditeur$$ 
CREATE PROCEDURE afficherCorrespondanceEditeur(IN editeurValNom varchar(45))
# l'usager veut savoir tous les contenu existant correspondant à un editeur en particulier
afficherCorrespondanceEditeur_label:BEGIN

select Code_Barre,Numero_License,Titre,Support,Editeur.nom
from Contenu join edite 
on Contenu.Code_Barre =edite.Contenu_Code_Barre and Contenu.Numero_License = edite.Contenu_Numero_License
join Editeur 
on Editeur.id=edite.Editeur_id
where Editeur.nom=editeurValNom;


END;
$$


drop procedure if exists afficherCorrespondanceEtablissement$$ 
CREATE PROCEDURE afficherCorrespondanceEtablissement(IN etablissementValNom varchar(45))
# l'usager veut savoir tous les contenu existant correspondant à un etablissement en particulier
afficherCorrespondanceEtablissement_label:BEGIN

select Code_Barre,Numero_License,Titre,Support,Etablissement.nom
from Contenu join possede 
on Contenu.Code_Barre =possede.Contenu_Code_Barre and Contenu.Numero_License = possede.Contenu_Numero_License
join Etablissement 
on Etablissement.id=possede.Etablissement_id
where Etablissement.nom=etablissementValNom;


END;
$$

drop procedure if exists afficherCorrespondanceTitre$$ 
CREATE PROCEDURE afficherCorrespondanceTitre(IN contenuValTitre varchar(45))
# l'usager veut savoir tous les contenu existant correspondant à un Titre en particulier
afficherCorrespondanceTitre_label:BEGIN


select Code_Barre,Numero_License,Titre,Support
from Contenu 
where Contenu.Titre LIKE CONCAT("%",contenuValTitre,"%");


END;
$$



############################################################################################################################

drop procedure if exists afficherCorrespondanceMotCle$$ 
CREATE PROCEDURE afficherCorrespondanceMotCle(IN MotCle varchar(45))
# l'usager veut savoir tous les contenu existant correspondant à un Mot Cle en particulier
afficherCorrespondanceMotCle:BEGIN

select Code_Barre,Numero_License,Titre,Support,Etablissement.nom as Etablissement, Genre.nom as Genre, Artiste.nom as Artiste, Artiste.type as Role 
from Contenu join possede 
on Contenu.Code_Barre =possede.Contenu_Code_Barre and Contenu.Numero_License = possede.Contenu_Numero_License
join Etablissement 
on Etablissement.id=possede.Etablissement_id

join Décrit 
on Contenu.Code_Barre =Décrit.Contenu_Code_Barre and Contenu.Numero_License = Décrit.Contenu_Numero_License
join Genre 
on genre.id=Décrit.Genre_id
join Participe 
on Contenu.Code_Barre =Participe.Contenu_Code_Barre and Contenu.Numero_License = Participe.Contenu_Numero_License
join Artiste 
on artiste.id=Participe.Artiste_id

where Etablissement.nom LIKE CONCAT("%",MotCle,"%")or
      Genre.nom LIKE CONCAT("%",MotCle,"%") or
      Artiste.nom LIKE CONCAT("%",MotCle,"%") or
      Contenu.Titre LIKE CONCAT("%",MotCle,"%");


END;
$$














#CALL afficherTout();
#CALL afficherNumerique();
#CALL afficherPhysique();
#CALL afficherCorrespondanceArtiste("Stendhal");
#CALL afficherCorrespondanceGenre("science fiction");
#CALL afficherCorrespondanceEditeur("Gallimard");
#CALL afficherCorrespondanceEtablissement("ENSSAT");
CALL afficherCorrespondanceMotCle("st");
#CALL afficherCorrespondanceTitre("st");

