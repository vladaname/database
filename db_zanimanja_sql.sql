CREATE TABLE zanimanja (
  id_zanimanja INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_firme VARCHAR(45)  NOT NULL  ,
  adresa_firme VARCHAR(45)  NOT NULL  ,
  delatnost VARCHAR(45)  NULL  ,
  telefon INTEGER UNSIGNED  NULL  ,
  email VARCHAR(255)  NOT NULL  ,
  sediste_firme VARCHAR(20) BINARY  NULL    ,
PRIMARY KEY(id_zanimanja));




