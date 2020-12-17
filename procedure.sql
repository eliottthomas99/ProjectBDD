USE bibliotheque;
DELIMITER $$

DROP PROCEDURE IF EXISTS ajoutGenre $$
CREATE PROCEDURE ajoutGenre(IN genreVal VARCHAR(45))
BEGIN
      INSERT INTO genre (nom)
      SELECT genreVal
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM genre
                  WHERE nom = genreVal
                  LIMIT 1
            );
END;$$

DROP PROCEDURE IF EXISTS ajoutEditeur $$
CREATE PROCEDURE ajoutEditeur(IN editeurVal VARCHAR(45))
BEGIN
      INSERT INTO editeur (nom)
      SELECT editeurVal
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM editeur
                  WHERE nom = editeurVal
                  LIMIT 1
            );
END;$$

DROP PROCEDURE IF EXISTS ajoutArtiste $$
CREATE PROCEDURE ajoutArtiste(
      IN artisteValNom VARCHAR(45),
      artisteValType VARCHAR(45)
)
BEGIN
      INSERT INTO artiste (nom, type)
      SELECT artisteValNom,
            artisteValType
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM artiste
                  WHERE nom = artisteValNom
                        AND type = artisteValType
                  LIMIT 1
            );
END;$$

DROP PROCEDURE IF EXISTS ajoutEtablissement $$
CREATE PROCEDURE ajoutEtablissement(IN etablissementValNom VARCHAR(45))
BEGIN
      INSERT INTO etablissement (nom)
      SELECT etablissementValNom
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM etablissement
                  WHERE nom = etablissementValNom
                  LIMIT 1
            );
END;$$

##############################################################

DROP PROCEDURE IF EXISTS ajoutEdite $$
CREATE PROCEDURE ajoutEdite(
      IN editeValNom VARCHAR(45),
      editeValCodeBarre INT,
      editeValNumeroLicense INT)
BEGIN
      INSERT INTO edite (
                  Editeur_id,
                  Contenu_Code_Barre,
                  Contenu_Numero_License
            )
      SELECT (
                  SELECT id
                  FROM editeur
                  WHERE nom = editeValNom
            ),
            editeValCodeBarre,
            editeValNumeroLicense
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM edite
                  WHERE Editeur_id =(
                              SELECT id
                              FROM editeur
                              WHERE nom = editeValNom
                        )
                        AND Contenu_Code_Barre = editeValCodeBarre
                        AND Contenu_Numero_License = editeValNumeroLicense
                  LIMIT 1
            );
END;$$

DROP PROCEDURE IF EXISTS ajoutParticipe $$
CREATE PROCEDURE ajoutParticipe(
      IN participeValNom VARCHAR(45),
      participeValType VARCHAR(45),
      participeValCodeBarre INT,
      participeValNumeroLicense INT)
BEGIN
      INSERT INTO participe (
                  Artiste_id,
                  Contenu_Code_Barre,
                  Contenu_Numero_License
            )
      SELECT (
                  SELECT id
                  FROM artiste
                  WHERE nom = participeValNom
                        AND type = participeValType
            ),
            participeValCodeBarre,
            participeValNumeroLicense
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM participe
                  WHERE Artiste_id =(
                              SELECT id
                              FROM artiste
                              WHERE nom = participeValNom
                                    AND type = participeValType
                        )
                        AND Contenu_Code_Barre = participeValCodeBarre
                        AND Contenu_Numero_License = participeValNumeroLicense
                  LIMIT 1
            );
END;$$

DROP PROCEDURE IF EXISTS ajoutDecrit $$
CREATE PROCEDURE ajoutDecrit(
      IN decritValNom VARCHAR(45),
      decritValCodeBarre INT,
      decritValNumeroLicense INT)
BEGIN
      INSERT INTO décrit (
                  Genre_id,
                  Contenu_Code_Barre,
                  Contenu_Numero_License
            )
      SELECT (
                  SELECT id
                  FROM genre
                  WHERE nom = decritValNom
            ),
            decritValCodeBarre,
            decritValNumeroLicense
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM décrit
                  WHERE Genre_id =(
                              SELECT id
                              FROM genre
                              WHERE nom = decritValNom
                        )
                        AND Contenu_Code_Barre = decritValCodeBarre
                        AND Contenu_Numero_License = decritValNumeroLicense
                  LIMIT 1
            );
END;$$

DROP PROCEDURE IF EXISTS ajoutPossede $$
CREATE PROCEDURE ajoutPossede(
      IN possedeValNom VARCHAR(45),
      possedeValCodeBarre INT,
      possedeValNumeroLicense INT)
      BEGIN
      INSERT INTO possede (
                  Etablissement_id,
                  Contenu_Code_Barre,
                  Contenu_Numero_License
            )
      SELECT (
                  SELECT id
                  FROM etablissement
                  WHERE nom = possedeValNom
            ),
            possedeValCodeBarre,
            possedeValNumeroLicense
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM possede
                  WHERE Etablissement_id =(
                              SELECT id
                              FROM etablissement
                              WHERE nom = possedeValNom
                        )
                        AND # ligne non nécéssaire car selon le sujet un contenu ne peut être possédé que par un établissement. On le laisse en vue d une éventuelle évolution.
                        Contenu_Code_Barre = possedeValCodeBarre
                        AND Contenu_Numero_License = possedeValNumeroLicense
                  LIMIT 1
            );
END;$$

###########################################################################
# Ajout&Relation
###########################################################################

DROP PROCEDURE IF EXISTS ajoutLienPossede $$
CREATE PROCEDURE ajoutLienPossede(
      IN etablissementNom VARCHAR(45),
      possedeValCodeBarre INT,
      possedeValNumeroLicense INT)
BEGIN
      CALL ajoutEtablissement(etablissementNom);
      CALL ajoutPossede(etablissementNom,possedeValCodeBarre,possedeValNumeroLicense);
END;$$

DROP PROCEDURE IF EXISTS ajoutLienDecrit $$
CREATE PROCEDURE ajoutLienDecrit(
      IN genreNom VARCHAR(45),
      decritValCodeBarre INT,
      decritValNumeroLicense INT)
BEGIN
      CALL ajoutGenre(genreNom);
      CALL ajoutDecrit(genreNom,decritValCodeBarre,decritValNumeroLicense);
END;$$

DROP PROCEDURE IF EXISTS ajoutLienParticipe $$
CREATE PROCEDURE ajoutLienParticipe(
      IN artisteNom VARCHAR(45),
      artisteRole VARCHAR(45),
      participeValCodeBarre INT,
      participeValNumeroLicense INT)
BEGIN
      CALL ajoutArtiste(artisteNom, artisteRole);
      CALL ajoutParticipe(artisteNom,artisteRole,participeValCodeBarre,participeValNumeroLicense);
END;$$

DROP PROCEDURE IF EXISTS ajoutLienEdite $$
CREATE PROCEDURE ajoutLienEdite(
      IN EditeurNom VARCHAR(45),
      EditeValCodeBarre INT,
      EditeValNumeroLicense INT)
BEGIN
      CALL ajoutEditeur(EditeurNom);
      CALL ajoutEdite(EditeurNom,EditeValCodeBarre,EditeValNumeroLicense);
END;$$

############################################################################
#ajoutLivre(contenuValCodeBarre,contenuValTitre,contenuValCodeCatalogue,artisteValAuteur,genreValGenre,editeurValEditeur)
###########################################################################

DROP PROCEDURE IF EXISTS ajoutLivre $$
CREATE PROCEDURE ajoutLivre(
      IN contenuValCodeBarre INT,
      contenuValTitre VARCHAR(45),
      contenuValCodeCatalogue INT,
      artisteValAuteur VARCHAR(45),
      genreValGenre VARCHAR(45),
      editeurValEditeur VARCHAR(45),
      etablissementValNom VARCHAR(45))

AJOUTLIVRE_LABEL :BEGIN
      IF (
            SELECT COUNT(*)
            FROM contenu
            WHERE Code_Barre = contenuValCodeBarre
      ) >= 1 THEN LEAVE AJOUTLIVRE_LABEL;
      END IF;
      INSERT INTO contenu (
                  Code_Barre,
                  Numero_License,
                  Titre,
                  Type,
                  Support,
                  CodeCatalogue
            )
      SELECT contenuValCodeBarre,
            0,
            contenuValTitre,
            'physique',
            'livre',
            contenuValCodeCatalogue
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM contenu
                  WHERE Code_Barre = contenuValCodeBarre
                  LIMIT 1
            );
      CALL ajoutArtiste(artisteValAuteur, "ecrivain");
      CALL ajoutGenre(genreValGenre);
      CALL ajoutEditeur(editeurValEditeur);
      CALL ajoutEtablissement(etablissementValNom);

      #tables de relations
      CALL ajoutEdite(editeurValEditeur, contenuValCodeBarre, 0);
      CALL ajoutParticipe(artisteValAuteur, "ecrivain", contenuValCodeBarre, 0);
      CALL ajoutDecrit(genreValGenre, contenuValCodeBarre, 0);
      CALL ajoutPossede(etablissementValNom, contenuValCodeBarre, 0);
END;$$

############################################################################
#ajoutDVD(contenuValCodeBarre,contenuValTitre,contenuValCodeCatalogue,artisteValRealisateur,artisteValProducteur,genreValGenre)
############################################################################

DROP PROCEDURE IF EXISTS ajoutDVD $$
CREATE PROCEDURE ajoutDVD(
      IN contenuValCodeBarre INT,
      contenuValTitre VARCHAR(45),
      contenuValCodeCatalogue INT,
      artisteValRealisateur VARCHAR(45),
      artisteValProducteur VARCHAR(45),
      genreValGenre VARCHAR(45),
      etablissementValNom VARCHAR(45))

AJOUTDVD_LABEL :BEGIN
      IF (
            SELECT COUNT(*)
            FROM contenu
            WHERE Code_Barre = contenuValCodeBarre
      ) >= 1 THEN LEAVE AJOUTDVD_LABEL;
      END IF;
      INSERT INTO contenu (
                  Code_Barre,
                  Numero_License,
                  Titre,
                  Type,
                  Support,
                  CodeCatalogue
            )
      SELECT contenuValCodeBarre,
            0,
            contenuValTitre,
            'physique',
            'DVD',
            contenuValCodeCatalogue
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM contenu
                  WHERE Code_Barre = contenuValCodeBarre
                  LIMIT 1
            );
      CALL ajoutArtiste(artisteValRealisateur, "realisateur");
      CALL ajoutArtiste(artisteValProducteur, "producteur");
      CALL ajoutGenre(genreValGenre);
      CALL ajoutEtablissement(etablissementValNom);

      #tables de relations
      CALL ajoutParticipe(artisteValRealisateur, "realisateur", contenuValCodeBarre, 0);
      CALL ajoutParticipe(artisteValProducteur, "producteur", contenuValCodeBarre, 0);
      CALL ajoutDecrit(genreValGenre, contenuValCodeBarre, 0);
      CALL ajoutPossede(etablissementValNom, contenuValCodeBarre, 0);
END;$$

############################################################################
#ajoutEFILM(contenuValCodeBarre,contenuValTitre,contenuValCodeCatalogue,artisteValRealisateur,artisteValProducteur,genreValGenre)
############################################################################

DROP PROCEDURE IF EXISTS ajoutEFilm $$
CREATE PROCEDURE ajoutEFilm(
      IN contenuValNumeroLicense INT,
      contenuValTitre VARCHAR(45),
      contenuValCodeCatalogue INT,
      artisteValRealisateur VARCHAR(45),
      artisteValProducteur VARCHAR(45),
      genreValGenre VARCHAR(45),
      etablissementValNom VARCHAR(45))

AJOUTEFILM_LABEL :BEGIN
      IF (
            SELECT COUNT(*)
            FROM contenu
            WHERE Numero_License = contenuValNumeroLicense
      ) >= 1 THEN LEAVE AJOUTEFILM_LABEL;
      END IF;
      INSERT INTO contenu (
                  Code_Barre,
                  Numero_License,
                  Titre,
                  Type,
                  Support,
                  CodeCatalogue
            )
      SELECT 0,
            contenuValNumeroLicense,
            contenuValTitre,
            'numerique',
            'efilm',
            contenuValCodeCatalogue
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM contenu
                  WHERE Numero_License = contenuValNumeroLicense
                  LIMIT 1
            );
      CALL ajoutArtiste(artisteValRealisateur, "realisateur");
      CALL ajoutArtiste(artisteValProducteur, "producteur");
      CALL ajoutGenre(genreValGenre);
      CALL ajoutEtablissement(etablissementValNom);

      #tables de relations
      CALL ajoutParticipe(artisteValRealisateur, "realisateur", 0, contenuValNumeroLicense);
      CALL ajoutParticipe(artisteValProducteur, "producteur", 0, contenuValNumeroLicense);
      CALL ajoutDecrit(genreValGenre, 0, contenuValNumeroLicense);
      CALL ajoutPossede(etablissementValNom, 0, contenuValNumeroLicense);
END;$$

############################################################################
#ajoutEBook(contenuValCodeBarre,contenuValTitre,contenuValCodeCatalogue,artisteValAuteur,genreValGenre,editeurValEditeur)
###########################################################################

DROP PROCEDURE IF EXISTS ajoutEBook $$
CREATE PROCEDURE ajoutEBook(
      IN contenuValCodeBarre INT,
      contenuValTitre VARCHAR(45),
      contenuValCodeCatalogue INT,
      artisteValAuteur VARCHAR(45),
      genreValGenre VARCHAR(45),
      editeurValEditeur VARCHAR(45),
      etablissementValNom VARCHAR(45))

ajoutEBook_LABEL :BEGIN
      IF (
            SELECT COUNT(*)
            FROM contenu
            WHERE Code_Barre = contenuValCodeBarre
      ) >= 1 THEN LEAVE ajoutEBook_LABEL;
      END IF;
      INSERT INTO contenu (
                  Code_Barre,
                  Numero_License,
                  Titre,
                  Type,
                  Support,
                  CodeCatalogue
            )
      SELECT contenuValCodeBarre,
            0,
            contenuValTitre,
            'numérique',
            'ebook',
            contenuValCodeCatalogue
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM contenu
                  WHERE Code_Barre = contenuValCodeBarre
                  LIMIT 1
            );
      CALL ajoutArtiste(artisteValAuteur, "ecrivain");
      CALL ajoutGenre(genreValGenre);
      CALL ajoutEditeur(editeurValEditeur);
      CALL ajoutEtablissement(etablissementValNom);

      #tables de relations
      CALL ajoutEdite(editeurValEditeur, contenuValCodeBarre, 0);
      CALL ajoutParticipe(artisteValAuteur, "ecrivain", contenuValCodeBarre, 0);
      CALL ajoutDecrit(genreValGenre, contenuValCodeBarre, 0);
      CALL ajoutPossede(etablissementValNom, contenuValCodeBarre, 0);
END;$$

###########################################################################################################
#ajoutAbonne(abonneValNom,abonneValPrenom,abonneValAdresse)
############################################################################

DROP PROCEDURE IF EXISTS ajoutAbonne $$
CREATE PROCEDURE ajoutAbonne(
      IN abonneValNom VARCHAR(45),
      abonneValPrenom VARCHAR(45),
      abonneValAdresse VARCHAR(45))

AJOUTABONNE_LABEL :BEGIN
      INSERT INTO abonne (nom, prenom, adresse, dateAdhesion, penalite)
      SELECT abonneValNom,
            abonneValPrenom,
            abonneValAdresse,
            CURDATE(),
            0
      FROM DUAL
      WHERE NOT EXISTS (
                  SELECT *
                  FROM abonne
                  WHERE adresse = abonneValAdresse
                  LIMIT 1
            );
END;
$$


DELIMITER ;

CALL ajoutLivre(
      10,
      "Harry Potter a l'ecole des sorciers",
      19,
      "JK Rowling",
      "fantastique",
      "Gallimard jeunesse",
      "ENSSAT"
);
CALL ajoutLivre(
      20,
      "Titatic",
      20,
      "Stendhal",
      "Roman",
      "Anthony Ingels",
      "ENSSAT"
);
CALL ajoutGenre('policier');
CALL ajoutEditeur('Hachette');
CALL ajoutEditeur('Gallimard');
CALL ajoutArtiste('Napoleon Hill', 'ecrivain');
CALL ajoutEdite('Gallimard', 20, 0);
CALL ajoutParticipe('Napoleon Hill', "ecrivain", 20, 0);
CALL ajoutLivre(
      30,
      "La Chartreuse de Parme",
      24,
      "Stendhal",
      "Roman",
      "Ambroise Dupont",
      "Orange"
);
CALL ajoutLivre(
      40,
      "Le rouge et le noir",
      25,
      "Stendhal",
      "Roman",
      "Levasseur",
      "IUT"
);
CALL ajoutEtablissement("Orange");
CALL ajoutPossede("ENSSAT", 20, 0);
CALL ajoutPossede("ENSSAT", 10, 0);
CALL ajoutDVD(
      50,
      "Nemo",
      26,
      "Andrew Stanton",
      "Pixar",
      "animation",
      "ENSSAT"
);
#CALL ajoutLienPossede("Nokia", 20,0);
CALL ajoutLienDecrit("aventure", 50, 0);
CALL ajoutLienParticipe("Lee Unkrich", "realisateur", 50, 0);
CALL ajoutLienEdite("Gallimard", 20, 0);
CALL ajoutEFilm(
      60,
      "Star Wars Episode III",
      27,
      "George Lucas",
      "Rick McCallum",
      "science fiction",
      "ENSSAT"
);
CALL ajoutEFilm(70,"Star Wars Episode III",27,"George Lucas","Rick McCallum","science fiction","ENSSAT");
CALL ajoutEBook(80,"Narnia",28,"C S Lewis","fantastique","Gallimard jeunesse","IUT");
CALL ajoutAbonne("THOMAS", "Julien", "jthomas@enssat.fr");
CALL ajoutAbonne("THOMAS","Jeremy","jthoma1@enssat.fr");
CALL ajoutAbonne("THOMAS","Eliott","ethomas@enssat.fr");