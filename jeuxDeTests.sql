use bibliotheque;



# CAS 0 : TEST procedure afficherTout
#CALL afficherTout(); #Un ulilisateur regarde les contenus proposés





/*
#CAS12 : TEST procédure emprunterContenu
CALL emprunterContenu(72,0,38); #l'abonne 38 souhaite emprunter un contenu et il est libre
#CALL afficherTout(); #on regarde si la colonne emprunte est passé à 1 pour le contenu (72,0)
*/




#CAS2 : l'utilisateur souhaite emprunter un contenu et il n'est pas libre.
CALL emprunterContenu(108,0,38); # L'abonne 38 emprunte le seul exemplaire de Back in black
CALL emprunterContenu(108,0,39); #  pour l'abonne 39 : l'emprunt echoue
CALL reserverContenuEmprunte(41,39); #l'abonne réserve le contenu. Sa demande porte sur le CodeCatalogue. 
