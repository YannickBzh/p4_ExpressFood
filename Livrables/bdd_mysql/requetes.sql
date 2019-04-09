
--AFFICHER LES COMMANDE EN FONCTION DES JOURS

SELECT * FROM commande WHERE date_livraison='2018-07-09';

--AFFICHER LE NUMERO DE TELEPHONE D'UN LIVREUR EN FONCTION DE SON NOM

SELECT telephone FROM livreur WHERE nom='brody';

--AFFICHER LES INGREDIENTS DONT LA VALEUR ENERGETIQUE EST DE 100Kcal

SELECT * FROM ingredient WHERE valeur_energetique='100Kcal';

--AFFICHER LES DIFFERENTS PLATS ET DESSERTS AVEC PRIX ET DESCRIPTIF

SELECT nom, prix, descriptif FROM produit;

--AFFICHER NOM ET PRENOM DE L'UTILISATEUR EN FONCTION DU MOT DE PASSE

SELECT nom, prenom FROM utilisateur WHERE mot_de_passe='madonna';

-- AFFICHER LE NOM ET PRENOM DU LIVREUR AYANT LIVRÉ UN CLIENT EN PARTICULIER
SELECT utilisateur.nom AS "nom client", utilisateur.prenom AS "prenom client", livreur.nom AS "nom livreur", livreur.prenom AS "prenom livreur" 
FROM livreur 
INNER JOIN adresse_livraison ON livreur.adresse_livraison_id = adresse_livraison_id 
INNER JOIN utilisateur ON adresse_livraison.client_id = utilisateur.id 
WHERE utilisateur.id = 5

-- AFFICHER LE MONTANT TOTAL DÉPENSÉ PAR UN CLIENT EN PARTICULIER
SELECT utilisateur.prenom AS "prénom client", utilisateur.nom AS "nom client", commande.prix_total AS "Montant commande"
FROM commande
INNER JOIN utilisateur ON commande.client_id = utilisateur.id
WHERE utilisateur.id = 7

-- AFFICHER LES PRODUITS COMMANDÉS PAR UN CLIENT EN PARTICULIER
SELECT utilisateur.nom, utilisateur.prenom, produit.nom 
FROM utilisateur 
INNER JOIN commande ON utilisateur.id = commande.client_id 
INNER JOIN commande_produit ON commande.commande_produit_id = commande_produit.id 
INNER JOIN produit ON commande_produit.produit_id = produit.id 
WHERE utilisateur.id = 1