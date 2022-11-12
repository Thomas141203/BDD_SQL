--
-- Base de données : mag_info
--

-- --------------------------------------------------------

--
-- Structure de la table clients
--

CREATE TABLE clients (
  client_id int(11) PRIMARY KEY NOT NULL,
  nom varchar(40) NOT NULL,
  prenom varchar(40) NOT NULL,
  ville varchar(40) DEFAULT NULL,
  pays varchar(40) DEFAULT NULL,
  tel varchar(10) DEFAULT NULL
) ;

--
-- Déchargement des données de la table clients
--

INSERT INTO clients (client_id,nom,prenom,ville,pays,tel) VALUES
(1,'Sacquet','Thierry','Paris','France','0102030405'),
(2,'Gamegie','Samuel','Paris','France','0103040506'),
(3,'Legris','Loic','Toulouse','France','0402030405'),
(4,'Loriot','Anthony','Paris','USA',NULL),
(5,'Essi','Nicolas','New York','USA',NULL);

-- --------------------------------------------------------
--
-- Structure de la table produits
--

CREATE TABLE produits (
  prod_id int(11) PRIMARY KEY NOT NULL,
  libelle varchar(40) NOT NULL,
  prix float NOT NULL
) ;

--
-- Déchargement des données de la table produits
--

INSERT INTO produits (prod_id,libelle,prix) VALUES
(1,'clavier',10.5),
(2,'souris',5),
(3,'écran',199.9),
(4,'disque dur',130),
(5,'clavier',8.5),
(6,'écran',149.9);

--
-- Structure de la table commandes
--

CREATE TABLE commandes (
  cmd_id int(11) PRIMARY KEY NOT NULL,
  date_cmd date NOT NULL,
  client_id int(11) NOT NULL,
  CONSTRAINT commandes_FK FOREIGN KEY(client_id) REFERENCES clients(client_id)
);

--
-- Déchargement des données de la table commandes
--

INSERT INTO commandes (cmd_id,date_cmd,client_id) VALUES
(1,'2020-08-19',1),
(2,'2019-08-19',3),
(3,'2027-04-18',5),
(4,'2015-08-19',1),
(5,'2017-06-16',4),
(6,'2014-08-19',1);

-- --------------------------------------------------------

--
-- Structure de la table lignes_commande
--

CREATE TABLE lignes_commande (
  cmd_id int(11) NOT NULL,
  prod_id int(11) NOT NULL,
  quantite int(11) DEFAULT NULL,
  remise float DEFAULT NULL,
  PRIMARY KEY(cmd_id,prod_id),
  CONSTRAINT lignes_commande_FK1 FOREIGN KEY(cmd_id) REFERENCES commandes(cmd_id),
  CONSTRAINT lignes_commande_FK2 FOREIGN KEY(prod_id) REFERENCES produits(prod_id)
);

--
-- Déchargement des données de la table lignes_commande
--

INSERT INTO lignes_commande (cmd_id,prod_id,quantite,remise) VALUES
(1,1,5,10.5),
(1,2,5,5),
(2,6,1,0),
(3,5,1,0),
(4,1,1,0),
(4,2,1,0),
(4,4,1,0),
(5,6,2,9.9),
(6,1,1,0);

-- --------------------------------------------------------
