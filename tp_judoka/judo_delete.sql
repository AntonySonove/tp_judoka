-- reqête de suppression
INSERT INTO judoka (nom_judoka, prenom_judoka, age, sexe, id_niveau) VALUES
	("Sonove", "Antony", 32, "H", 7), ("Unnom", "Unprenom", 44, "F", 6);
    
DELETE FROM judoka WHERE nom_judoka="Sonove";
DELETE FROM judoka WHERE nom_judoka="Unnom";