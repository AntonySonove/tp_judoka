-- afficher la liste des joueurs
SELECT pseudo_joueur
FROM joueur;

-- afficher le pseudo et le mail du troisième joeur inscrit
SELECT pseudo_joueur,mail_joueur
FROM joueur AS j
WHERE j.id_joueur=3;

-- afficher le pseudo du premier joueur et sa liste de personnage
SELECT pseudo_joueur, nom_personnage
FROM joueur AS j
INNER JOIN personnage AS p
ON j.id_joueur=p.id_joueur
WHERE j.id_joueur=1;

-- afficher le pseudo du premier joueur et la liste des costumes acheté pour ses personnages
SELECT pseudo_joueur,nom_personnage,nom_costume
FROM joueur AS j
INNER JOIN achat AS a
ON j.id_joueur=a.id_joueur
INNER JOIN costume AS c
ON a.id_costume=c.id_costume
INNER JOIN personnage AS p
ON a.id_joueur=p.id_joueur
WHERE j.id_joueur=1;

-- afficher le montant total dépensé par chaque joueurs par ordre décroissant
SELECT j.pseudo_joueur,nom_costume, SUM(prix) total
FROM costume AS c
INNER JOIN achat AS a
ON c.id_costume=a.id_costume
INNER JOIN joueur AS j
ON a.id_joueur=j.id_joueur
INNER JOIN personnage AS p
ON a.id_joueur=p.id_joueur
GROUP BY pseudo_joueur DESC;

-- liste d'amis

SELECT j.pseudo_joueur, amis.pseudo_joueur
FROM joueur AS j
INNER JOIN carnet_amis AS ca
ON j.id_carnet_amis=ca.id_carnet_amis
JOIN contenir AS c
ON ca.id_carnet_amis=c.id_carnet_amis
INNER JOIN joueur AS amis
ON c.id_joueur=amis.id_joueur
WHERE j.id_joueur=3;

-- liste d'amis
SELECT pseudo_joueur, message
FROM joueur AS j
INNER JOIN message AS m
ON j.id_joueur=m.id_auteur
WHERE j.id_joueur=3;

-- messagerie
SELECT pseudo_joueur, message
FROM joueur AS j
INNER JOIN message AS m
ON j.id_joueur=m.id_destinataire
WHERE j.id_joueur=3;