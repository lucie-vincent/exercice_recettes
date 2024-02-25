-- QUESTION 1 --
SELECT recette.nom AS nom_recette, recette.temps_preparation, 
categorie.nom AS nom_categorie
FROM recette 
JOIN categorie ON recette.id_categorie = categorie.id_categorie
ORDER BY temps_preparation DESC;

-- QUESTION 2 --
SELECT recette.nom AS nom_recette, recette.temps_preparation, 
categorie.nom AS nom_categorie,
COUNT(cuisiner.id_ingredient) AS nombre_ingredients
FROM recette 
JOIN categorie ON recette.id_categorie = categorie.id_categorie
JOIN cuisiner ON recette.id_recette = cuisiner.id_recette
GROUP BY recette.nom, recette.temps_preparation, categorie.nom
ORDER BY temps_preparation DESC;

-- SELECT id_recette, 
-- COUNT(id_ingredient) 
-- FROM cuisiner 
-- GROUP BY id_recette 

-- QUESTION 3 --
SELECT * FROM recette WHERE temps_preparation >= 30;

-- QUESTION 4 --
SELECT recette.nom FROM recette WHERE nom LIKE 'salade%';

-- QUESTION 5 --
INSERT INTO recette 
VALUES ('11', 'pâtes à la carbonara', '20', 'faire cuire les pâtes.ajouter un oeuf', '2');

-- QUESTION 6 --
UPDATE recette SET nom = 'glace vanille maison' WHERE id_recette = 3;

-- QUESTION 7 --
DELETE FROM recette WHERE id_recette = 12;

-- QUESTION 8 --
SELECT cuisiner.id_recette, recette.nom
SUM(ingredient.prix * cuisiner.quantite) AS prix_total 
FROM cuisiner 
NATURAL JOIN ingredient 
WHERE cuisiner.id_recette = 5 
GROUP BY id_recette;

-- QUESTION 9 --
SELECT recette.nom, cuisiner.quantite, ingredient.nom, ingredient.prix, 
FROM recette 
JOIN cuisiner ON recette.id_recette = cuisiner.id_recette 
JOIN ingredient ON cuisiner.id_ingredient = ingredient.id_ingredient 
WHERE recette.id_recette = 5;

-- QUESTION 10 --
INSERT INTO ingredient VALUES ('21', 'poivre', '2.5', 'cuillère à café');

-- QUESTION 11 --
UPDATE ingredient SET prix = 8 WHERE id_ingredient = 12;

-- QUESTION 12 --
SELECT categorie.nom AS nom_categorie,
COUNT(recette.id_recette) AS nombre_recette
FROM categorie
JOIN recette ON categorie.id_categorie = recette.id_categorie
GROUP BY categorie.nom;

-- QUESTION 13 -- 
SELECT recette.nom FROM recette 
JOIN cuisiner ON recette.id_recette = cuisiner.id_recette
JOIN ingredient ON cuisiner.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom LIKE "poulet";

-- QUESTION 14 --
UPDATE recette SET temps_preparation = temps_preparation - 5;

-- QUESTION 15 --
SELECT * FROM recette WHERE recette.nom 
NOT IN (
SELECT recette.nom FROM recette 
JOIN cuisiner ON recette.id_recette = cuisiner.id_recette  
JOIN ingredient ON cuisiner.id_ingredient = ingredient.id_ingredient 
WHERE ingredient.prix > 2);

-- QUESTION 16 --
SELECT nom, temps_preparation FROM recette 
WHERE temps_preparation = (
SELECT MIN(temps_preparation) FROM recette);

-- QUESTION 17 --
SELECT recette.nom FROM recette 
NATURAL JOIN cuisiner 
WHERE cuisiner.id_ingredient IS NULL;

-- QUESTION 18 --
SELECT ingredient.nom AS nom_ingredient 
FROM ingredient
JOIN cuisiner ON ingredient.id_ingredient = cuisiner.id_ingredient
GROUP BY ingredient.id_ingredient
HAVING COUNT(DISTINCT cuisiner.id_recette) >= 3;

-- QUESTION 19 --
INSERT INTO cuisiner (id_recette, id_ingredient, quantite)
SELECT "11", id_ingredient, "1"
FROM ingredient
WHERE nom = "poivre";


-- QUESTION 20 --
SELECT recette.nom AS nom_recette,
SUM(ingredient.prix * cuisiner.quantite) AS prix_total
FROM recette
JOIN cuisiner ON recette.id_recette = cuisiner.id_recette
JOIN ingredient ON cuisiner.id_ingredient = ingredient.id_ingredient
GROUP BY recette.nom
ORDER BY prix_total DESC
LIMIT 1;