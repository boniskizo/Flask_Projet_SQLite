CREATE TABLE Utilisateurs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    role ENUM('utilisateur', 'administrateur') NOT NULL DEFAULT 'utilisateur'
);

CREATE TABLE Livres (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titre VARCHAR(255) NOT NULL,
    auteur VARCHAR(255) NOT NULL,
    annee_publication INT,
    categorie VARCHAR(100),
    stock INT NOT NULL DEFAULT 1
);

CREATE TABLE Emprunts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
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
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    utilisateur_id INT,
    message TEXT NOT NULL,
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (utilisateur_id) REFERENCES Utilisateurs(id) ON DELETE CASCADE
);

CREATE TABLE Recommandations (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    utilisateur_id INT,
    livre_id INT,
    date_recommandation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (utilisateur_id) REFERENCES Utilisateurs(id) ON DELETE CASCADE,
    FOREIGN KEY (livre_id) REFERENCES Livres(id) ON DELETE CASCADE
);

CREATE TABLE Statistiques (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    livre_id INT,
    nombre_emprunts INT DEFAULT 0,
    dernier_emprunt DATE,
    FOREIGN KEY (livre_id) REFERENCES Livres(id) ON DELETE CASCADE
);
