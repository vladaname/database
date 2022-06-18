CREATE TABLE uloga (
  id_uloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_uloge VARCHAR(30)  NULL    ,
PRIMARY KEY(id_uloga));



CREATE TABLE osoba (
  id_osoba INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  uloga_id_uloga INTEGER UNSIGNED  NOT NULL  ,
  ime VARCHAR(50)  NULL  ,
  prezime VARCHAR(50)  NULL  ,
  tel VARCHAR(50)  NULL  ,
  email VARCHAR(50)  NULL    ,
PRIMARY KEY(id_osoba)  ,
INDEX osoba_FKIndex1(uloga_id_uloga),
  FOREIGN KEY(uloga_id_uloga)
    REFERENCES uloga(id_uloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE automobil (
  id_automobil INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  osoba_id_osoba INTEGER UNSIGNED  NOT NULL  ,
  marka VARCHAR(30)  NULL  ,
  model VARCHAR(20)  NULL  ,
  kilometraza INTEGER UNSIGNED  NULL  ,
  vrednost INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_automobil)  ,
INDEX automobil_FKIndex1(osoba_id_osoba),
  FOREIGN KEY(osoba_id_osoba)
    REFERENCES osoba(id_osoba)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE nekretnina (
  id_nekretnina INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  osoba_id_osoba INTEGER UNSIGNED  NOT NULL  ,
  grad VARCHAR(30)  NULL  ,
  deo_grada VARCHAR(50)  NULL  ,
  sobnost INTEGER UNSIGNED  NULL  ,
  kvadratura INTEGER UNSIGNED  NULL  ,
  sprat INTEGER UNSIGNED  NULL  ,
  cena INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_nekretnina)  ,
INDEX nekretnina_FKIndex1(osoba_id_osoba),
  FOREIGN KEY(osoba_id_osoba)
    REFERENCES osoba(id_osoba)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




