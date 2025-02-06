ALTER TABLE costume
	ADD COLUMN prix DECIMAL (5,2) NOT NULL;
UPDATE costume SET prix=20 WHERE id_costume=1;
UPDATE costume SET prix=35 WHERE id_costume=2;
UPDATE costume SET prix=15.5 WHERE id_costume=3;
UPDATE costume SET prix=29.5 WHERE id_costume=4;

INSERT INTO achat (date_achat,id_joueur,id_costume,id_personnage) VALUES
("2022-05-10",1,1,1),("2022-06-01",1,2,7),("2022-06-21",3,4,3),("2022-06-21",1,3,1),
("2022-06-23",3,5,3),("2022-07-03",5,1,5);

    
-- DROP DATABASE combat_d_arene;