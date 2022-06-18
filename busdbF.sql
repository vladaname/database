CREATE TABLE red_voznje (
  id_red_voznje INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  start VARCHAR(50)  NULL  ,
  cilj VARCHAR(50)  NULL  ,
  vreme_polaska DATETIME  NULL  ,
  vreme_dolaska DATETIME  NULL  ,
  distanca INTEGER UNSIGNED  NULL  ,
  cena_start INTEGER UNSIGNED  NULL  ,
  cena_km INTEGER UNSIGNED  NULL  ,
  ukupna_cena INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_red_voznje));



CREATE TABLE uloga (
  id_uloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv VARCHAR(50)  NULL    ,
PRIMARY KEY(id_uloga));



CREATE TABLE autobus (
  id_autobus INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv VARCHAR(50)  NULL  ,
  broj_sedista INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_autobus));



CREATE TABLE voznja (
  id_voznja INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  red_voznje_id_red_voznje INTEGER UNSIGNED  NOT NULL  ,
  autobus_id_autobus INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(id_voznja)  ,
INDEX voznja_FKIndex1(autobus_id_autobus)  ,
INDEX voznja_FKIndex2(red_voznje_id_red_voznje),
  FOREIGN KEY(autobus_id_autobus)
    REFERENCES autobus(id_autobus)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(red_voznje_id_red_voznje)
    REFERENCES red_voznje(id_red_voznje)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE osoba (
  id_osoba INTEGER UNSIGNED  NOT NULL  ,
  voznja_id_voznja INTEGER UNSIGNED  NOT NULL  ,
  uloga_id_uloga INTEGER UNSIGNED  NOT NULL  ,
  ime VARCHAR(50)  NULL  ,
  prezime VARCHAR(50)  NULL  ,
  email VARCHAR(100)  NULL  ,
  username VARCHAR(50)  NULL  ,
  pass VARCHAR(1000)  NULL    ,
PRIMARY KEY(id_osoba)  ,
INDEX osoba_FKIndex1(uloga_id_uloga)  ,
INDEX osoba_FKIndex2(voznja_id_voznja),
  FOREIGN KEY(uloga_id_uloga)
    REFERENCES uloga(id_uloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(voznja_id_voznja)
    REFERENCES voznja(id_voznja)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




