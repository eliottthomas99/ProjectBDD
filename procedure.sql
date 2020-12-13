use bibliotheque;

delimiter $$
drop procedure if exists ajoutGenre $$
CREATE PROCEDURE ajoutGenre(IN genreVal varchar(45))

BEGIN

INSERT INTO genre (nom) 
SELECT genreVal FROM DUAL 
WHERE NOT EXISTS (SELECT * FROM genre 
      WHERE nom=genreVal LIMIT 1) ;


END;
$$

drop procedure if exists ajoutEditeur $$
CREATE PROCEDURE ajoutEditeur(IN editeurVal varchar(45))

BEGIN

INSERT INTO editeur (nom) 
SELECT editeurVal FROM DUAL 
WHERE NOT EXISTS (SELECT * FROM editeur 
      WHERE nom=editeurVal LIMIT 1) ;


END;
$$


drop procedure if exists ajoutArtiste$$
CREATE PROCEDURE ajoutArtiste(IN artisteValNom varchar(45), artisteValType varchar(45))

BEGIN

INSERT INTO artiste (nom,type) 
SELECT artisteValNom,artisteValType FROM DUAL 
WHERE NOT EXISTS (SELECT * FROM artiste 
      WHERE nom=artisteValNom and type=artisteValType LIMIT 1) ;


END;
$$

drop procedure if exists ajoutArtiste$$
CREATE PROCEDURE ajoutArtiste(IN artisteValNom varchar(45), artisteValType varchar(45))

BEGIN

INSERT INTO artiste (nom,type) 
SELECT artisteValNom,artisteValType FROM DUAL 
WHERE NOT EXISTS (SELECT * FROM artiste 
      WHERE nom=artisteValNom and type=artisteValType LIMIT 1) ;


END;
$$

drop procedure if exists ajoutEdite$$
CREATE PROCEDURE ajoutEdite(IN editeValNom varchar(45), editeValCodeBarre INT, editeValNumeroLicense INT)

BEGIN

INSERT INTO edite (Editeur_id,Contenu_Code_Barre,Contenu_Numero_License) 
SELECT (select id from editeur where nom =editeValNom),
       editeValCodeBarre,
       editeValNumeroLicense FROM DUAL 
WHERE NOT EXISTS (SELECT * FROM edite 
      WHERE Editeur_id=(select id from editeur where nom =editeValNom) and
            Contenu_Code_Barre=editeValCodeBarre and
            Contenu_Numero_License=editeValNumeroLicense
            LIMIT 1) ;


END;
$$


drop procedure if exists ajoutParticipe$$
CREATE PROCEDURE ajoutParticipe(IN participeValNom varchar(45), participeValCodeBarre INT, participeValNumeroLicense INT)

BEGIN

INSERT INTO participe (Artiste_id,Contenu_Code_Barre,Contenu_Numero_License) 
SELECT (select id from artiste where nom =participeValNom),
       participeValCodeBarre,
       participeValNumeroLicense FROM DUAL 
WHERE NOT EXISTS (SELECT * FROM participe 
      WHERE Artiste_id=(select id from artiste where nom =participeValNom) and
            Contenu_Code_Barre=participeValCodeBarre and
            Contenu_Numero_License=participeValNumeroLicense
            LIMIT 1) ;


END;
$$

drop procedure if exists ajoutDecrit$$
CREATE PROCEDURE ajoutDecrit(IN decritValNom varchar(45), decritValCodeBarre INT, decritValNumeroLicense INT)

BEGIN

INSERT INTO décrit (Genre_id,Contenu_Code_Barre,Contenu_Numero_License) 
SELECT (select id from genre where nom =decritValNom),
       decritValCodeBarre,
       decritValNumeroLicense FROM DUAL 
WHERE NOT EXISTS (SELECT * FROM décrit 
      WHERE Genre_id=(select id from genre where nom =decritValNom) and
            Contenu_Code_Barre=decritValCodeBarre and
            Contenu_Numero_License=decritValNumeroLicense
            LIMIT 1) ;


END;
$$


############################################################################
#ajoutLivre(contenuValCodeBarre,contenuValTitre,contenuValCodeCatalogue,artisteValAuteur,genreValGenre,editeurValEditeur)
############################################################################
drop procedure if exists ajoutLivre$$
CREATE PROCEDURE ajoutLivre(IN contenuValCodeBarre INT, 
							contenuValTitre varchar(45),
							contenuValCodeCatalogue INT,
                            artisteValAuteur varchar(45),
                            genreValGenre varchar(45),
                            editeurValEditeur varchar(45))

ajoutLivre_label:BEGIN


IF (select Count(*) from contenu where Code_Barre=contenuValCodeBarre)>=1 THEN
	leave ajoutLivre_label;
END IF;

INSERT INTO contenu (Code_Barre,Numero_License,Titre,Type,Support,CodeCatalogue) 
SELECT contenuValCodeBarre, 0, contenuValTitre,'physique','livre', contenuValCodeCatalogue FROM DUAL 
WHERE NOT EXISTS (SELECT * FROM contenu 
      WHERE Code_Barre=contenuValCodeBarre
            LIMIT 1) ;
 
CALL ajoutArtiste(artisteValAuteur,"ecrivain");
CALL ajoutGenre(genreValGenre);
CALL ajoutEditeur(editeurValEditeur);

#tables de relations
CALL ajoutEdite(editeurValEditeur,contenuValCodeBarre,0);
CALL ajoutParticipe(artisteValAuteur,contenuValCodeBarre,0);
CALL ajoutDecrit(genreValGenre,contenuValCodeBarre,0);


END;
$$

###########################################################################################################




DELIMITER ;


CALL ajoutGenre('policier');

CALL ajoutEditeur('Hachette');

CALL ajoutArtiste('Napoleon Hill','ecrivain');

CALL ajoutEdite('Gallimard',20,0);

CALL ajoutParticipe('Napoleon Hill',20,0);

CALL ajoutLivre(30,"La Chartreuse de Parme",24,"Stendhal","Roman","Ambroise Dupont");

CALL ajoutLivre(30,"Le rouge et le noir",25,"Stendhal","Roman","Levasseur");








