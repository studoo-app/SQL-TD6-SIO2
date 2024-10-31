![separe](https://github.com/studoo-app/.github/blob/main/profile/studoo-banner-logo.png)
# TD 6 - Les views SQL
[![Version](https://img.shields.io/badge/Version-2024-blue)]()

## Description
Projet contenant une base de données MariaDb et un PHPMyAdmin ayant pour finalité
de s'initier et s'entrainer à la création de views en SQL.

### Schéma de la base de données
![Schéma de la base](./docs/schema.png)

## Contexte
Vous travaillez pour un hôpital qui souhaite mieux structurer ses données et sécuriser les informations des patients.
L’hôpital utilise une base de données pour gérer les informations des patients, les traitements, et les médecins.
Vous devez créer des views pour simplifier l'accès aux informations médicales et restreindre l'accès à des données sensibles.

## Missions

### 1 - Création d’une View pour Simplifier l’Accès aux Informations des Patients
Créez une view nommée infos_patients pour permettre au personnel administratif de consulter les informations de base 
des patients sans accéder à leur diagnostic ou traitement.

- Incluez les colonnes : id_patient, nom, prenom, date_naissance, sexe, assurance.
- Excluez les colonnes adresse, telephone, diagnostic et traitement.

### 2 - Création d’une View pour Suivre les Consultations par Médecin
Créez une view nommée consultations_medecins qui affiche pour chaque médecin le nombre de consultations effectuées et 
le nombre de patients uniques rencontrés.

- Incluez les colonnes : id_medecin, nom, prenom, specialite, nombre_consultations, patients_uniques.
- nombre_consultations représente le nombre total de consultations pour chaque médecin.
- patients_uniques représente le nombre unique de patients consultés par chaque médecin.

### 3 - Création d’une View pour les Dernières Consultations des Patients

Créez une view nommée derniere_consultation pour afficher la date de la dernière consultation et le diagnostic pour chaque patient.

- Incluez les colonnes id_patient, nom, prenom, date_naissance, date_consultation, et diagnostic. 
- date_consultation doit être la date la plus récente pour chaque patient

### 4 - Création d’une View pour la Sécurité des Informations Médicales
Créez une view nommée consultations_secure qui permet de consulter les informations de consultation sans afficher les
diagnostics ou traitements sensibles.

- Incluez les colonnes : id_consultation, nom, prenom, date_consultation.
- Utilisez JOIN pour afficher les noms et prénoms des patients, mais masquez les colonnes diagnostic et traitement.

### 5 - Suppression d’une View
Supprimez la view infos_patients.


## Installation
- `docker compose up -d` pour démarrer les services

## Documentation

### Définition
Une **view** (ou vue en français) est une table virtuelle qui est le résultat d'une requête SQL. 
Elle ne stocke pas directement les données, mais contient une définition de requête pour extraire les données d'une 
ou plusieurs tables de la base de données. Les views sont utilisées pour simplifier les requêtes et pour sécuriser 
l'accès aux données sensibles.

### Prinicpaux avantages
- **Simplicité des requêtes** : Les views permettent de simplifier des requêtes complexes en une seule.
- **Sécurité** : Elles restreignent l'accès aux données sensibles, en affichant uniquement les colonnes autorisées.
- **Indépendance des données** : En cas de changement dans les tables sources, la view peut rester intacte, permettant une plus grande flexibilité.
- **Réutilisation** : Une view peut être réutilisée dans d'autres requêtes sans avoir à réécrire la logique.

### Création d'une View

```sql
    CREATE VIEW nom_de_la_view AS
    SELECT colonnes
    FROM tables
    WHERE condition;
```
**Exemple** : Créons une view qui montre uniquement les informations essentielles des employés.
```sql
    CREATE VIEW employes_ville AS
    SELECT nom, prenom, ville
    FROM employes
    WHERE ville = 'Paris';
```
Ici, la view `employes_ville` affiche uniquement les noms, prénoms et la ville des employés de Paris.

### Consultation des données d'une View

Une fois la view créée, elle peut être utilisée comme une table classique avec la commande `SELECT`.
```sql
    SELECT * FROM employes_ville;
```

### Mise à jour d'une View
Pour modifier une view, il faut utiliser la commande `CREATE OR REPLACE VIEW`, ce qui permet de redéfinir la requête de la view sans la supprimer.

```sql
    CREATE OR REPLACE VIEW employes_ville AS
    SELECT nom, prenom, ville, departement
    FROM employes
    WHERE ville = 'Paris';
```

### Suppression d'une View
Pour supprimer une view, il suffit d'utiliser la commande `DROP VIEW`.
```sql
    DROP VIEW employes_ville;
```

### Exemples d'utilisations

#### Exemple 1 : Création d'une View pour la Sécurité
Imaginons une table `salaries` contenant des informations sensibles comme le salaire des employés. 
Nous voulons donner accès uniquement à leur nom, prénom, et département.

```sql
CREATE VIEW infos_employes AS
SELECT nom, prenom, departement
FROM salaries;
```

#### Exemple 2 : Création d'une View pour Simplifier une Requête Complexe
Supposons que nous ayons plusieurs tables : commandes, clients, et produits. Nous pouvons créer une view pour afficher 
les détails de chaque commande avec le nom du client et la description du produit.

```sql
CREATE VIEW details_commandes AS
SELECT commandes.id_commande, clients.nom_client, produits.description, commandes.quantite
FROM commandes
JOIN clients ON commandes.id_client = clients.id_client
JOIN produits ON commandes.id_produit = produits.id_produit;
```

En utilisant cette view, la récupération des informations de commande devient plus simple :
```sql
SELECT * FROM details_commandes WHERE nom_client = 'Dupont';
```