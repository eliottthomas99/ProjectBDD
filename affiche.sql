use bibliotheque;

select * from contenu,artiste,participe where (id=Artiste_id and Code_Barre=Contenu_Code_Barre and Numero_License=Contenu_Numero_License)and(artiste.nom="JK Rowling") ;

#select id from artiste where nom ='JK Rowling';
#select Code_Barre from contenu where Titre="Titanic";
#select Numero_License from contenu where Titre="Harry Potter à lécole des sorciers";*/