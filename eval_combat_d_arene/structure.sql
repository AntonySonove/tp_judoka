CREATE DATABASE combat_d_arene;
USE combat_d_arene;
CREATE TABLE carnet_amis(
id_carnet_amis INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nom_carnet VARCHAR(50) NOT NULL
);
CREATE TABLE message(
id_message INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
date_message DATETIME NOT NULL,
sujet VARCHAR(255) NOT NULL,
message TEXT NOT NULL,
id_auteur INT,
id_destinataire INT
);
CREATE TABLE costume(
id_costume INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nom_costume VARCHAR(50) NOT NULL
);
CREATE TABLE joueur(
id_joueur INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
pseudo_joueur VARCHAR(50) NOT NULL,
mdp_joueur VARCHAR(150) NOT NULL,
mail_joueur VARCHAR(100) NOT NULL,
id_carnet_amis INT
);
CREATE TABLE arene(
id_arene INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nom_arene VARCHAR(50) NOT NULL
);
CREATE TABLE achat(
id_achat INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
date_achat DATETIME NOT NULL,
id_personnage INT,
id_costume INT,
id_joueur INT
);
CREATE TABLE personnage(
id_personnage INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nom_personnage VARCHAR(50) NOT NULL,
id_type_personnage INT,
id_joueur INT
);
CREATE TABLE combat(
id_combat INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
date_combat DATETIME NOT NULL,
id_arene INT,
id_vaincu INT,
id_vainqueur INT
);
CREATE TABLE item(
id_item INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nom_item VARCHAR(50) NOT NULL,
bonus_point_de_vie INT NOT NULL,
bonus_defense INT NOT NULL,
bonus_attaque INT NOT NULL
);
CREATE TABLE type_personnage(
id_type_personnage INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
type_personnage VARCHAR(50) NOT NULL,
attaque INT NOT NULL,
point_de_vie INT NOT NULL,
defense INT NOT NULL
);
CREATE TABLE contenir(
id_joueur INT,
id_carnet_amis INT,
PRIMARY KEY (id_joueur, id_carnet_amis)
);
CREATE TABLE obtenir(
id_personnage INT,
id_item INT,
equipe BOOL,
PRIMARY KEY (id_personnage, id_item)
);
ALTER TABLE contenir
	ADD CONSTRAINT fk_joueur_contenir
    FOREIGN KEY (id_joueur) REFERENCES joueur (id_joueur);
ALTER TABLE contenir
	ADD CONSTRAINT fk_carnet_amis_contenir
    FOREIGN KEY (id_carnet_amis) REFERENCES carnet_amis (id_carnet_amis);
ALTER TABLE message
	ADD CONSTRAINT fk_auteur_message
    FOREIGN KEY (id_auteur) REFERENCES joueur (id_joueur);
ALTER TABLE message
	ADD CONSTRAINT fk_destinataire_message
    FOREIGN KEY (id_destinataire) REFERENCES joueur (id_joueur);
ALTER TABLE joueur
	ADD CONSTRAINT fk_carnet_amis_joueur
    FOREIGN KEY (id_carnet_amis) REFERENCES carnet_amis (id_carnet_amis);
ALTER TABLE achat
	ADD CONSTRAINT fk_achat_personnage
    FOREIGN KEY (id_personnage) REFERENCES personnage (id_personnage);
ALTER TABLE achat
	ADD CONSTRAINT fk_costume_achat
    FOREIGN KEY (id_costume) REFERENCES costume (id_costume);
ALTER TABLE achat
	ADD CONSTRAINT fk_joueur_achat
    FOREIGN KEY (id_joueur) REFERENCES joueur (id_joueur);
ALTER TABLE obtenir
	ADD CONSTRAINT fk_personnage_obtenir
    FOREIGN KEY (id_personnage) REFERENCES personnage (id_personnage);
ALTER TABLE obtenir
	ADD CONSTRAINT fk_item_obtenir
    FOREIGN KEY (id_item) REFERENCES item (id_item);
ALTER TABLE personnage
	ADD CONSTRAINT fk_type_personnage_personnage
    FOREIGN KEY (id_type_personnage) REFERENCES type_personnage (id_type_personnage);
ALTER TABLE personnage
	ADD CONSTRAINT fk_joueur_personnage
    FOREIGN KEY (id_joueur) REFERENCES joueur (id_joueur);
ALTER TABLE combat
	ADD CONSTRAINT fk_arene_combat
    FOREIGN KEY (id_arene) REFERENCES arene (id_arene);
ALTER TABLE combat
	ADD CONSTRAINT fk_vaincu_combat
    FOREIGN KEY (id_vaincu) REFERENCES personnage (id_personnage);
ALTER TABLE combat
	ADD CONSTRAINT fk_vainqueur_arene
    FOREIGN KEY (id_vainqueur) REFERENCES personnage (id_personnage);
    
-- DROP DATABASE combat_d_arene;