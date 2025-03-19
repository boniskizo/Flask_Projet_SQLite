CREATE TABLE Utilisateurs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    role ENUM('utilisateur', 'administrateur') NOT NULL DEFAULT 'utilisateur'
);

CREATE TABLE Livres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(255) NOT NULL,
    auteur VARCHAR(255) NOT NULL,
    annee_publication INT,
    categorie VARCHAR(100),
    stock INT NOT NULL DEFAULT 1
);

CREATE TABLE Emprunts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    utilisateur_id INT,
    livre_id INT,
    date_emprunt DATE NOT NULL,
    date_retour_prevue DATE NOT NULL,
    date_retour_effective DATE,
    statut ENUM('emprunté', 'retourné', 'en retard') NOT NULL DEFAULT 'emprunté',
    FOREIGN KEY (utilisateur_id) REFERENCES Utilisateurs(id) ON DELETE CASCADE,
    FOREIGN KEY (livre_id) REFERENCES Livres(id) ON DELETE CASCADE
);

CREATE TABLE Notifications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    utilisateur_id INT,
    message TEXT NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (utilisateur_id) REFERENCES Utilisateurs(id) ON DELETE CASCADE
);

CREATE TABLE Recommandations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    utilisateur_id INT,
    livre_id INT,
    date_recommandation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (utilisateur_id) REFERENCES Utilisateurs(id) ON DELETE CASCADE,
    FOREIGN KEY (livre_id) REFERENCES Livres(id) ON DELETE CASCADE
);

CREATE TABLE Statistiques (
    id INT PRIMARY KEY AUTO_INCREMENT,
    livre_id INT,
    nombre_emprunts INT DEFAULT 0,
    dernier_emprunt DATE,
    FOREIGN KEY (livre_id) REFERENCES Livres(id) ON DELETE CASCADE
);
