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












#CALL afficherTout();
#CALL afficherNumerique();
#CALL afficherPhysique();
#CALL afficherCorrespondanceArtiste("Stendhal");
CALL afficherCorrespondanceGenre("science fiction");

