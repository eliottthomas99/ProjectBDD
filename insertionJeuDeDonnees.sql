use bibliotheque;

#Ajout de contenus
CALL ajoutEFilm(1,"Star Wars Episode I",1,"George Lucas","Rick McCallum","science fiction","ENSSAT");
CALL ajoutEFilm(2,"Star Wars Episode I",1,"George Lucas","Rick McCallum","science fiction","Nokia");
CALL ajoutEFilm(3,"Star Wars Episode I",1,"George Lucas","Rick McCallum","science fiction","IUT");
CALL ajoutEFilm(4,"Star Wars Episode II",2,"George Lucas","Rick McCallum","science fiction","ENSSAT");
CALL ajoutEFilm(5,"Star Wars Episode III",3,"George Lucas","Rick McCallum","science fiction","ENSSAT");
CALL ajoutEFilm(6,"Star Wars Episode III",3,"George Lucas","Rick McCallum","science fiction","IUT");
CALL ajoutEFilm(7,"Star Wars Episode IV",4,"George Lucas","Rick McCallum","science fiction","ENSSAT");
CALL ajoutEFilm(8,"Star Wars Episode V",5,"Irvin Kershner","Rick McCallum","science fiction","ENSSAT");
CALL ajoutEFilm(9,"Star Wars Episode VI",6,"Irvin Kershner","Rick McCallum","science fiction","ENSSAT");
CALL ajoutEFilm(10,"Star Wars Episode VI",6,"Irvin Kershner","Rick McCallum","science fiction","IUT");
CALL ajoutEFilm(11,"Star Wars Episode VII",7,"J.J. Abrams","J.J. Abrams","science fiction","ENSSAT");
CALL ajoutEFilm(12,"Star Wars Episode VIII",8,"Rian Johnson","Kathleen Kennedy","science fiction","ENSSAT");
CALL ajoutEFilm(13,"Star Wars Episode VIII",8,"Rian Johnson","Kathleen Kennedy","science fiction","Orange");
CALL ajoutEFilm(14,"Star Wars Episode IX",9,"J.J. Abrams","J.J. Abrams","science fiction","ENSSAT");
CALL ajoutEFilm(15,"Star Wars Episode IX",9,"J.J. Abrams","J.J. Abrams","science fiction","IFSI");
CALL ajoutEFilm(16,"Star Wars Episode IX",9,"J.J. Abrams","J.J. Abrams","science fiction","IUT");
CALL ajoutDVD(17,"Nemo",10,"Andrew Stanton","Pixar","animation","Nokia");
CALL ajoutDVD(18,"Cars",11,"John Lasseter","Pixar","animation","Orange");
CALL ajoutDVD(19,"Cars 2",12,"John Lasseter","Pixar","animation","Orange");
CALL ajoutDVD(20,"Cars 3",13,"Brian Fee","Pixar","animation","Orange");
CALL ajoutDVD(21,"L affaire Thomas Crown",14,"Norman Jewison","Norman Jewison","Policier","IUT");
CALL ajoutDVD(22,"Fast and furious",15,"Rob Cohen","Neal H. Moritz","action","IFSI");
CALL ajoutDVD(23,"Fast and furious 2",16,"John Singleton","Neal H. Moritz","action","IFSI");
CALL ajoutDVD(24,"Fast and furious 3",17,"Justin Lin","Neal H. Moritz","action","IFSI");
CALL ajoutDVD(25,"Fast and furious 4",18,"Justin Lin","Neal H. Moritz","action","IFSI");
CALL ajoutLivre(26,"La Chartreuse de Parme",19,"Stendhal","roman","Ambroise Dupont","Orange");
CALL ajoutLivre(27,"12 regles pour une vie",20,"J. Peterson","philosophie","J ai lu","Nokia");
CALL ajoutLivre(28,"Eloge de la gentilles",21,"E. Jaffelin","philosophie","Pocket","Nokia");
CALL ajoutLivre(29,"Psychologie des foules",22,"G. Le Bon","philosophie","Puf","ENSSAT");
CALL ajoutLivre(30,"The game",23,"N. Strauss","roman","J ai lu","ENSSAT");
CALL ajoutLivre(31,"The game",23,"N. Strauss","roman","J ai lu","ENSSAT");
CALL ajoutLivre(32,"Agir et penser comme james bond",25,"S. Garnier","philosophie","Opportun","Orange");
CALL ajoutLivre(33,"Le banquet",26,"Platon","philosophie","Flammarion","IFSI");
CALL ajoutLivre(34,"Le songe d une nuit d ete",27,"Shakespear","roman","Flammarion","IFSI");
CALL ajoutEBook(34,"Reflechissez et devenez riche",28,"N. Hill","philosophie","J ai lu","IFSI");
CALL ajoutEBook(35,"La volonte de puissance I",29,"Nietzsche","philosophie","Gallimard","ENSSAT");
CALL ajoutEBook(36,"La volonte de puissance II",30,"Nietzsche","philosophie","Gallimard","ENSSAT");
CALL ajoutEBook(37,"La volonte de puissance II",30,"Nietzsche","philosophie","Gallimard","IUT");
CALL ajoutEBook(38,"Memoire, souvenirs, oublis",31,"Freud","philosophie","PBP","IUT");
CALL ajoutEBook(39,"Fahrenheit 451",32,"R. Bradburry","science fiction","folio","IUT");
CALL ajoutEBook(40,"Les hommes viennent de mars",34,"J. Gray","philosophie","J ai lu","Nokia");
CALL ajoutEBook(41,"Comment se faire des amis",35,"D. Carnegie","philosophie","Livre de poche","Nokia");
CALL ajoutEBook(42,"Comment se faire des amis",35,"D. Carnegie","philosophie","Livre de poche","Orange");
CALL ajoutEBook(43,"Comment se faire des amis",35,"D. Carnegie","philosophie","Livre de poche","ENSSAT");
CALL ajoutEBook(44,"Comment se faire des amis",35,"D. Carnegie","philosophie","Livre de poche","IUT");
CALL ajoutEBook(45,"Comment se faire des amis",35,"D. Carnegie","philosophie","Livre de poche","IFSI");
CALL ajoutEBook(46,"Comment voyager avec un saumon",36,"U. Eco","philosophie","Livre de poche","IFSI");
CALL ajoutEBook(47,"Triomphez de vos soucis",37,"D. Carnegie","philosophie","Flammarion","ENSSAT");
CALL ajoutEBook(48,"LA PNL pour les nuls",38,"R. Ready","philosophie","Pour les nuls","ENSSAT");
CALL ajoutEBook(49,"LA PNL pour les nuls",38,"R. Ready","philosophie","Pour les nuls","Nokia");
CALL ajoutLivre(50,"Metaphysique de l amour sexuel",24,"A. Schopenhauer","philosophie","Mille et une nuits","Orange");

CALL ajoutContenu(106,0,"Nothing but the beat","physique","album",39,"IFSI","electro");
CALL ajoutLienParticipe("David Guetta","DJ",106,0);
CALL ajoutContenu(107,0,"Titanium","physique","CD",40,"IFSI","electro");
CALL ajoutLienParticipe("David Guetta","DJ",107,0);
CALL ajoutContenu(108,0,"Back in black","physique","album",41,"IFSI","rock");
CALL ajoutLienParticipe("ACDC","groupe",108,0);
CALL ajoutContenu(109,0,"Breath of the wild","numerique","jeu video",42,"ENSSAT","aventure");
CALL ajoutLienParticipe("Eiji Aonuma","direteur",109,0);
/**********************************************************************************/



CALL ajoutDVD(51,"Solo : a Star Wars Story",51,"Ron Howard","Kathleen Kennedy","aventure","IUT");
CALL ajoutDVD(52,"Solo : a Star Wars Story",51,"Ron Howard","Kathleen Kennedy","aventure","IFSI");
CALL ajoutDVD(53,"Solo : a Star Wars Story",51,"Ron Howard","Kathleen Kennedy","aventure","ENSSAT");
CALL ajoutDVD(54,"Rogue One : a Star Wars Story",52,"Ron Howard","Kathleen Kennedy","aventure","ENSSAT");
CALL ajoutDVD(55,"Rogue One : a Star Wars Story",52,"Ron Howard","Kathleen Kennedy","aventure","IUT");
CALL ajoutDVD(56,"Rogue One : a Star Wars Story",52,"Ron Howard","Kathleen Kennedy","aventure","Nokia");
CALL ajoutDVD(57,"Rogue One : a Star Wars Story",52,"Ron Howard","Kathleen Kennedy","aventure","Orange");
CALL ajoutDVD(58,"Inception",53,"Christopher Nolan","Christopher Nolan","action","IUT");
CALL ajoutDVD(59,"Inception",53,"Christopher Nolan","Christopher Nolan","action","ENSSAT");
CALL ajoutDVD(60,"Inception",53,"Christopher Nolan","Christopher Nolan","action","Orange");
CALL ajoutDVD(61,"Fight club",54,"David Fincher","Art Linson","drame","Orange");
CALL ajoutDVD(62,"Fight club",54,"David Fincher","Art Linson","drame","ENSSAT");
CALL ajoutDVD(63,"Fight club",54,"David Fincher","Art Linson","drame","IUT");
CALL ajoutDVD(64,"Avengers",55,"Joss Whedon","Kevin Feige","action","Orange");
CALL ajoutDVD(65,"Interstellar",56,"Christopher Nolan","Christopher Nolan","action","Orange");
CALL ajoutDVD(66,"Interstellar",56,"Christopher Nolan","Christopher Nolan","action","IUT");
CALL ajoutDVD(67,"Interstellar",56,"Christopher Nolan","Christopher Nolan","action","Nokia");


CALL ajoutEBook(68,"Narnia",57,"C S Lewis","fantastique","Gallimard jeunesse","IUT");
CALL ajoutEBook(69,"Narnia",57,"C S Lewis","fantastique","Gallimard jeunesse","ENSSAT");
CALL ajoutEBook(70,"Narnia",57,"C S Lewis","fantastique","Gallimard jeunesse","IUT");
CALL ajoutEBook(71,"Narnia",57,"C S Lewis","fantastique","Gallimard jeunesse","Nokia");
CALL ajoutEBook(72,"Narnia",57,"C S Lewis","fantastique","Gallimard jeunesse","ENSSAT");
CALL ajoutLivre(73,"Le rouge et le noir",58,"Stendhal","roman","Levasseur","IUT");
CALL ajoutLivre(75,"Le rouge et le noir",58,"Stendhal","roman","Levasseur","ENSSAT");
CALL ajoutLivre(76,"Le rouge et le noir",58,"Stendhal","roman","Levasseur","IFSI");
CALL ajoutLivre(77,"Le rouge et le noir",58,"Stendhal","roman","Levasseur","IFSI");
CALL ajoutLivre(78,"Harry Potter Episode I",59,"JK Rowling","fantastique","Gallimard jeunesse","ENSSAT");
CALL ajoutLivre(79,"Harry Potter Episode I",59,"JK Rowling","fantastique","Gallimard jeunesse","IFSI");
CALL ajoutLivre(80,"Harry Potter Episode I",59,"JK Rowling","fantastique","Gallimard jeunesse","IUT");
CALL ajoutLivre(81,"Harry Potter Episode I",59,"JK Rowling","fantastique","Gallimard jeunesse","Nokia");
CALL ajoutLivre(82,"Harry Potter Episode II",60,"JK Rowling","fantastique","Gallimard jeunesse","ENSSAT");
CALL ajoutLivre(83,"Harry Potter Episode II",60,"JK Rowling","fantastique","Gallimard jeunesse","IUT");
CALL ajoutLivre(84,"Harry Potter Episode II",60,"JK Rowling","fantastique","Gallimard jeunesse","IFSI");
CALL ajoutLivre(85,"Harry Potter Episode II",60,"JK Rowling","fantastique","Gallimard jeunesse","Orange");
CALL ajoutLivre(86,"Harry Potter Episode II",60,"JK Rowling","fantastique","Gallimard jeunesse","Nokia");
CALL ajoutLivre(87,"Harry Potter Episode II",60,"JK Rowling","fantastique","Gallimard jeunesse","Orange");
CALL ajoutLivre(88,"Harry Potter Episode III",61,"JK Rowling","fantastique","Gallimard jeunesse","ENSSAT");
CALL ajoutLivre(89,"Harry Potter Episode III",61,"JK Rowling","fantastique","Gallimard jeunesse","IUT");
CALL ajoutLivre(90,"Harry Potter Episode III",61,"JK Rowling","fantastique","Gallimard jeunesse","Orange");
CALL ajoutLivre(91,"Harry Potter Episode III",61,"JK Rowling","fantastique","Gallimard jeunesse","IFSI");
CALL ajoutLivre(92,"Harry Potter Episode III",61,"JK Rowling","fantastique","Gallimard jeunesse","Nokia");
CALL ajoutLivre(93,"Harry Potter Episode IV",62,"JK Rowling","fantastique","Gallimard jeunesse","ENSSAT");
CALL ajoutLivre(94,"Harry Potter Episode IV",62,"JK Rowling","fantastique","Gallimard jeunesse","IUT");
CALL ajoutLivre(95,"Harry Potter Episode IV",62,"JK Rowling","fantastique","Gallimard jeunesse","Nokia");
CALL ajoutLivre(96,"Harry Potter Episode IV",62,"JK Rowling","fantastique","Gallimard jeunesse","IFSI");
CALL ajoutLivre(97,"Harry Potter Episode IV",62,"JK Rowling","fantastique","Gallimard jeunesse","Orange");
CALL ajoutLivre(98,"Harry Potter Episode V",63,"JK Rowling","fantastique","Gallimard jeunesse","IFSI");
CALL ajoutLivre(99,"Harry Potter Episode V",63,"JK Rowling","fantastique","Gallimard jeunesse","Orange");
CALL ajoutLivre(100,"Harry Potter Episode V",63,"JK Rowling","fantastique","Gallimard jeunesse","Nokia");
CALL ajoutLivre(101,"Harry Potter Episode V",63,"JK Rowling","fantastique","Gallimard jeunesse","IUT");
CALL ajoutLivre(102,"Harry Potter Episode VI",64,"JK Rowling","fantastique","Gallimard jeunesse","IFSI");
CALL ajoutLivre(103,"Harry Potter Episode VI",64,"JK Rowling","fantastique","Gallimard jeunesse","Orange");
CALL ajoutLivre(104,"Harry Potter Episode VII",65,"JK Rowling","fantastique","Gallimard jeunesse","IUT");
CALL ajoutLivre(105,"Harry Potter Episode VII",65,"JK Rowling","fantastique","Gallimard jeunesse","Nokia");

CALL ajoutAbonne("THOMAS","Eliott","ethomas@enssat.fr");
CALL ajoutAbonne("THOMAS","Julien","jthomas@enssat.fr");
CALL ajoutAbonne("DUPOND","Bernard","bdupond@ifsi.fr");
CALL ajoutAbonne("SKYWALKER","Rey","rskywalker@enssat.fr");
CALL ajoutAbonne("PALPATINE","Rey","rpalpatine@enssat.fr");
CALL ajoutAbonne("DURJARDIN","Jean","jdujardin@nokia.fr");
CALL ajoutAbonne("BON","Jean","jbon@iut.fr");
CALL ajoutAbonne("DURAND","Michel","mdurand@ifsi.fr");
CALL ajoutAbonne("DARC","Jeanne","jdarc@ifsi.fr");
CALL ajoutAbonne("DESNOYER","Aimée","adesnoyer@iut.fr");
CALL ajoutAbonne("NADEAU","Christabel","cnadeau@orange.fr");
CALL ajoutAbonne("LABOSSIERE","Garland","glabossiere@ifsi.fr");
CALL ajoutAbonne("DUFRESNE","Alexandrin","adufresne@iut.fr");
CALL ajoutAbonne("JETTE","Martin","mjette@orange.fr");
CALL ajoutAbonne("FOUQUET","Fayette","ffouquet@nokia.fr");
CALL ajoutAbonne("COULOMBE","Percy","pcouloumbe@enssat.fr");
CALL ajoutAbonne("JARDINE","Octave","ojardine@ifsi.fr");
CALL ajoutAbonne("LEROUX","Eloise","eleroux@nokia.fr");
CALL ajoutAbonne("RAYMOND","Angelette","araymond@iut.fr");
CALL ajoutAbonne("MARCEAU","Eliot","emarceau@orange.fr");






