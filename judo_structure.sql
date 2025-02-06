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