use bibliotheque;
/*
insert into abonne (nom,prenom,adresse,dateAdhesion,penalite) values ('THOMAS','Julien','Place des Ursulines','2020-12-11',0); 
insert into abonne (nom,prenom,adresse,dateAdhesion,penalite) values ('THOMAS','Eliott','Venelle des 3 avocats','2020-12-11',0); 

insert into contenu(Code_Barre,Numero_License,Titre,Type,Support,codeCatalogue) values (10,0,'Harry Potter à l\école des sorciers','physique','livre',1);

insert into editeur (nom) values ('Gallimard');
insert into editeur (nom) values ('Gallimard Jeunesse');

insert into artiste (nom,type) values ('JK Rowling','ecrivain');

insert into genre (nom) values ('fantastique');

insert into etablissement (nom) values ('ENSSAT');*/

#insert into contenu(Code_Barre,Numero_License,Titre,Type,Support,codeCatalogue) values (20,0,'Titanic','physique','livre',23);

#insert into artiste (nom,type) values ('Anthony Ingels','ecrivain');

/*
insert into participe values (
(select id from artiste where nom ='JK Rowling'),
(select Code_Barre from contenu where Titre="Harry Potter à lécole des sorciers"),
(select Numero_License from contenu where Titre="Harry Potter à l'école des sorciers"));*/
/*
insert into participe values (
(select id from artiste where nom ='Anthony Ingels'),
(select Code_Barre from contenu where Titre="Titanic"),
(select Numero_License from contenu where Titre="Titanic"));*/





