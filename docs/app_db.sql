
-- Table des patients
CREATE TABLE patients (
  id_patient INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(50),
  prenom VARCHAR(50),
  date_naissance DATE,
  adresse VARCHAR(100),
  telephone VARCHAR(20),
  sexe VARCHAR(10),
  assurance VARCHAR(50)
);

-- Table des médecins
CREATE TABLE medecins (
  id_medecin INT PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(50),
  prenom VARCHAR(50),
  specialite VARCHAR(50),
  telephone VARCHAR(20)
);

-- Table des consultations
CREATE TABLE consultations (
   id_consultation INT PRIMARY KEY AUTO_INCREMENT,
   id_patient INT,
   id_medecin INT,
   date_consultation DATE,
   diagnostic TEXT,
   traitement TEXT,
   FOREIGN KEY (id_patient) REFERENCES patients(id_patient),
   FOREIGN KEY (id_medecin) REFERENCES medecins(id_medecin)
);

-- Insertion de données dans la table patients
INSERT INTO patients (nom, prenom, date_naissance, adresse, telephone, sexe, assurance) VALUES
    ('Dupont', 'Marie', '1985-04-15', '123 Rue de Paris, Paris', '0102030405', 'F', 'MutuelleA'),
    ('Martin', 'Jean', '1970-08-22', '45 Avenue de Lyon, Lyon', '0607080910', 'M', 'MutuelleB'),
    ('Lefevre', 'Lucie', '1990-12-10', '78 Rue de Lille, Lille', '0112233445', 'F', 'MutuelleA'),
    ('Durand', 'Pierre', '1982-05-01', '10 Rue de Bordeaux, Bordeaux', '0677889900', 'M', 'MutuelleC'),
    ('Moreau', 'Sophie', '1995-11-30', '50 Rue de Nice, Nice', '0644455566', 'F', 'MutuelleB');

-- Insertion de données dans la table medecins
INSERT INTO medecins (nom, prenom, specialite, telephone) VALUES
  ('Bernard', 'Alice', 'Cardiologie', '0755443322'),
  ('Garcia', 'Michel', 'Dermatologie', '0655332211'),
  ('Roux', 'Emilie', 'Pédiatrie', '0677223344'),
  ('Perrin', 'Jacques', 'Orthopédie', '0655667788'),
  ('Fournier', 'Claire', 'Gastro-entérologie', '0766554433');

-- Insertion de données dans la table consultations
INSERT INTO consultations (id_patient, id_medecin, date_consultation, diagnostic, traitement) VALUES
  (1, 1, '2024-01-10', 'Hypertension artérielle', 'Traitement antihypertenseur'),
  (2, 2, '2024-02-15', 'Acné sévère', 'Crème dermatologique et antibiotique'),
  (3, 3, '2024-03-20', 'Rhume de l’enfant', 'Sirop antitussif et repos'),
  (4, 4, '2024-04-05', 'Fracture du bras', 'Plâtre et rééducation'),
  (5, 5, '2024-05-30', 'Reflux gastro-œsophagien', 'Inhibiteur de la pompe à protons'),
  (1, 1, '2024-06-12', 'Suivi hypertension', 'Ajustement traitement'),
  (2, 2, '2024-07-18', 'Eczéma', 'Crème anti-inflammatoire'),
  (3, 3, '2024-08-25', 'Vaccination de rappel', 'Vaccin administré'),
  (4, 4, '2024-09-15', 'Entorse de la cheville', 'Bandage et kinésithérapie'),
  (5, 5, '2024-10-05', 'Gastrite', 'Traitement antacide');
