CREATE TABLE korisnik (
  id_korisnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  username VARCHAR(45)  NULL  ,
  pass VARCHAR(45)  NULL    ,
PRIMARY KEY(id_korisnik));



CREATE TABLE stanje (
  id_stanje INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  trenutno_stanje INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_stanje));



CREATE TABLE kategorija (
  id_kategorija INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_kategorije VARCHAR(200)  NULL    ,
PRIMARY KEY(id_kategorija));



CREATE TABLE uloga (
  id_uloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_uloge VARCHAR(100)  NULL    ,
PRIMARY KEY(id_uloga));



CREATE TABLE osoba (
  id_osoba INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  uloga_id_uloga INTEGER UNSIGNED  NOT NULL  ,
  korisnik_id_korisnik INTEGER UNSIGNED  NOT NULL  ,
  name VARCHAR(100)  NULL  ,
  surname VARCHAR(100)  NULL  ,
  tel VARCHAR(100)  NULL  ,
  email VARCHAR(100)  NULL    ,
PRIMARY KEY(id_osoba)  ,
INDEX osoba_FKIndex1(korisnik_id_korisnik)  ,
INDEX osoba_FKIndex2(uloga_id_uloga),
  FOREIGN KEY(korisnik_id_korisnik)
    REFERENCES korisnik(id_korisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(uloga_id_uloga)
    REFERENCES uloga(id_uloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE proizvod (
  id_proizvoda INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  osoba_id_osoba INTEGER UNSIGNED  NOT NULL  ,
  kategorija_id_kategorija INTEGER UNSIGNED  NOT NULL  ,
  naziv_proizvoda VARCHAR(200)  NULL  ,
  lager INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_proizvoda)  ,
INDEX proizvod_FKIndex1(kategorija_id_kategorija)  ,
INDEX proizvod_FKIndex2(osoba_id_osoba),
  FOREIGN KEY(kategorija_id_kategorija)
    REFERENCES kategorija(id_kategorija)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(osoba_id_osoba)
    REFERENCES osoba(id_osoba)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE komentar (
  id_komentar INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  osoba_id_osoba INTEGER UNSIGNED  NOT NULL  ,
  proizvod_id_proizvoda INTEGER UNSIGNED  NOT NULL  ,
  tekst VARCHAR(1500)  NULL    ,
PRIMARY KEY(id_komentar)  ,
INDEX komentar_FKIndex1(proizvod_id_proizvoda)  ,
INDEX komentar_FKIndex2(osoba_id_osoba),
  FOREIGN KEY(proizvod_id_proizvoda)
    REFERENCES proizvod(id_proizvoda)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(osoba_id_osoba)
    REFERENCES osoba(id_osoba)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




