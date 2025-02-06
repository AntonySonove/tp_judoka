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
WHERE j.age>19 AND n.couleur_ceinture="marron";

	-- liste des judokas par ordre alphabétique
SELECT nom_judoka, prenom_judoka, couleur_ceinture
FROM judoka AS j
INNER JOIN niveau AS n
ON j.id_niveau=n.id_niveau
ORDER BY nom_judoka ASC;