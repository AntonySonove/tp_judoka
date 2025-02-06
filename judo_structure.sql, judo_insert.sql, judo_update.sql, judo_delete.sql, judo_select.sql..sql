-- création de la BDD
CREATE DATABASE judoka;
USE judoka;

-- création des tables
CREATE TABLE judoka(
	id_judoka INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nom_judoka VARCHAR(50),
	prenom_judoka VARCHAR(50),
	age INT,
	sexe VARCHAR(5),
	id_niveau INT
 )engine=InnoDB;

CREATE TABLE judoka_competition (
	id_judoka INT,
	id_cpt INT,
	PRIMARY KEY (id_judoka, id_cpt)
 )engine=InnoDB;
 
 CREATE TABLE competition (
	id_cpt INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nom_cpt VARCHAR(50),
	date_fin DATE,
	date_debut DATE
 )engine=InnoDB;
 
 CREATE TABLE niveau (
	id_niveau INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	couleur_ceinture VARCHAR(50)
 )engine=InnoDB;
 
 -- ajout des clés étrangères
 ALTER TABLE judoka_competition
	ADD CONSTRAINT fk_judoka
    FOREIGN KEY (id_judoka) REFERENCES judoka (id_judoka);
 ALTER TABLE judoka_competition
	ADD CONSTRAINT fk_cpt
    FOREIGN KEY (id_cpt) REFERENCES competition (id_cpt);
ALTER TABLE judoka
	ADD CONSTRAINT fk_niveau
    FOREIGN KEY (id_niveau) REFERENCES niveau (id_niveau);
    
-- requêtes d'insertion
	-- niveaux
INSERT INTO niveau (couleur_ceinture) VALUES
	("blanche"),("jaune"),("orange"),("verte"),("bleau"),("marron"),("noire");
    
    -- ceinture
INSERT INTO judoka (nom_judoka, prenom_judoka, age, sexe, id_niveau) VALUES
	("Larchance", "Dominique", 16, "F", 2),("Porter", "Gilbert", 18, "H", 3),
    ("Lemaître", "Anne", 15, "F", 4),("Robert", "Juliette", 12, "F", 1),
    ("Montiny", "Pierre", 17, "H", 5),("Charrette", "Pascal", 21, "H", 6),
    ("Guay", "Emilie", 19, "F", 6),("Maheu", "Louise", 14, "F", 4),
    ("Poulin", "Raymon", 26, "H", 7),("Dupret", "Alain", 20, "H", 6);
    
	-- compétition
 INSERT INTO competition (nom_cpt, date_debut, date_fin) VALUES
	("judo31", "2021-02-06", "2021-02-07"),("judo11", "2021-02-27", "2021-02-28"),
    ("judo81", "2021-03-20", "2021-03-21"),("judo82", "2021-04-07", "2021-04-08");
    
	-- table d'association judoka et compétition
 INSERT INTO  judoka_competition (id_cpt, id_judoka) VALUES
	(1,1),(1,3),(1,4),(2,2),(2,5),(2,6),(2,9),(3,10),(3,9),(4,1),(4,3),(4,8),(4,4);
    
-- requête de mise à jour
UPDATE judoka
SET  id_niveau=id_niveau+1
WHERE id_judoka <6;

-- reqête de suppression
INSERT INTO judoka (nom_judoka, prenom_judoka, age, sexe, id_niveau) VALUES
	("Sonove", "Antony", 32, "H", 7), ("Unnom", "Unprenom", 44, "F", 6);
    
DELETE FROM judoka WHERE nom_judoka="Sonove";
DELETE FROM judoka WHERE nom_judoka="Unnom";

-- requête de séléction

	-- ceintures vertes
SELECT nom_judoka, prenom_judoka, couleur_ceinture
FROM judoka AS j
INNER JOIN niveau AS n
ON j.id_niveau=n.id_niveau;

	-- nombre de participant à la compétition judo31

SELECT COUNT(id_judoka) AS "nombre de participants" 
FROM judoka_competition AS jc
INNER JOIN competition AS c
ON jc.id_cpt=c.id_cpt
WHERE c.nom_cpt="judo31";

	-- liste du nombre de participant à la competition judo81
SELECT nom_judoka, prenom_judoka, age, sexe 
FROM judoka AS j
INNER JOIN judoka_competition AS jc
ON j.id_judoka=jc.id_judoka
INNER JOIN competition AS c
ON jc.id_cpt=c.id_cpt
WHERE c.nom_cpt="judo81";

	-- liste judoka de plus de 19 ans
SELECT nom_judoka, prenom_judoka, age, couleur_ceinture
FROM judoka AS j
INNER JOIN niveau AS n
ON j.id_niveau=n.id_niveau
WHERE j.age>19;

	-- liste des judokas par ordre alphabétique
SELECT nom_judoka, prenom_judoka, couleur_ceinture
FROM judoka AS j
INNER JOIN niveau AS n
ON j.id_niveau=n.id_niveau
ORDER BY nom_judoka ASC;
    
-- DROP DATABASE judoka;