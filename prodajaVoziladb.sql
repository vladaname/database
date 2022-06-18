CREATE TABLE uloga (
  iduloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv VARCHAR(50)  NULL    ,
PRIMARY KEY(iduloga));



CREATE TABLE osoba (
  idosoba INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  uloga_iduloga INTEGER UNSIGNED  NOT NULL  ,
  ime VARCHAR(100)  NULL  ,
  prezime VARCHAR(100)  NULL  ,
  email VARCHAR(100)  NULL  ,
  tel VARCHAR(100)  NULL    ,
PRIMARY KEY(idosoba)  ,
INDEX osoba_FKIndex1(uloga_iduloga),
  FOREIGN KEY(uloga_iduloga)
    REFERENCES uloga(iduloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE oglas (
  idoglas INTEGER UNSIGNED ZEROFILL  NOT NULL   AUTO_INCREMENT,
  osoba_idosoba INTEGER UNSIGNED  NOT NULL  ,
  datum_kreiranja DATETIME  NULL  ,
  vrsta_vozila VARCHAR(50)  NULL  ,
  marka VARCHAR(50)  NULL  ,
  model VARCHAR(50)  NULL  ,
  cena INTEGER UNSIGNED  NULL  ,
  promovisan INTEGER UNSIGNED  NULL  ,
  obrisan INTEGER UNSIGNED  NULL  ,
  tekst VARCHAR(2000)  NULL    ,
PRIMARY KEY(idoglas)  ,
INDEX oglas_FKIndex1(osoba_idosoba),
  FOREIGN KEY(osoba_idosoba)
    REFERENCES osoba(idosoba)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




