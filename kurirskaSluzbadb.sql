CREATE TABLE uloga (
  id_uloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv VARCHAR(50)  NULL    ,
PRIMARY KEY(id_uloga));



CREATE TABLE cenovnik (
  id_cenovnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  cena_do5kg INTEGER UNSIGNED  NULL  ,
  cena_od5do10kg INTEGER UNSIGNED  NULL  ,
  cena_preko10kg INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_cenovnik));



CREATE TABLE osoba (
  id_osoba INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  uloga_id_uloga INTEGER UNSIGNED  NOT NULL  ,
  ime VARCHAR(50)  NULL  ,
  prezime VARCHAR(50)  NULL  ,
  tel VARCHAR(50)  NULL  ,
  email VARCHAR(50)  NULL  ,
  adresa VARCHAR(50)  NULL  ,
  username VARCHAR(50)  NULL  ,
  pass VARCHAR(200)  NULL    ,
PRIMARY KEY(id_osoba)  ,
INDEX osoba_FKIndex1(uloga_id_uloga),
  FOREIGN KEY(uloga_id_uloga)
    REFERENCES uloga(id_uloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE posiljka (
  id_posiljka INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  osoba_id_osoba INTEGER UNSIGNED  NOT NULL  ,
  vreme_slanja DATETIME  NULL  ,
  vreme_dostave DATETIME  NULL  ,
  sifra_posiljke VARCHAR(200)  NULL  ,
  status_posiljke VARCHAR(50)  NULL  ,
  adresa_dostave VARCHAR(50)  NULL    ,
PRIMARY KEY(id_posiljka)  ,
INDEX posiljka_FKIndex1(osoba_id_osoba),
  FOREIGN KEY(osoba_id_osoba)
    REFERENCES osoba(id_osoba)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE komentar (
  id_komentar INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  osoba_id_osoba INTEGER UNSIGNED  NOT NULL  ,
  pitanje VARCHAR(1000)  NULL  ,
  odgovor VARCHAR(1000)  NULL    ,
PRIMARY KEY(id_komentar)  ,
INDEX komentar_FKIndex1(osoba_id_osoba),
  FOREIGN KEY(osoba_id_osoba)
    REFERENCES osoba(id_osoba)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE roba (
  id_roba INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  posiljka_id_posiljka INTEGER UNSIGNED  NOT NULL  ,
  osoba_id_osoba INTEGER UNSIGNED  NOT NULL  ,
  opis VARCHAR(50)  NULL  ,
  tezina INTEGER UNSIGNED  NULL  ,
  cena_otkupa INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_roba)  ,
INDEX roba_FKIndex1(osoba_id_osoba)  ,
INDEX roba_FKIndex2(posiljka_id_posiljka),
  FOREIGN KEY(osoba_id_osoba)
    REFERENCES osoba(id_osoba)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(posiljka_id_posiljka)
    REFERENCES posiljka(id_posiljka)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE racun (
  id_racun INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  cenovnik_id_cenovnik INTEGER UNSIGNED  NOT NULL  ,
  posiljka_id_posiljka INTEGER UNSIGNED  NOT NULL  ,
  ukupan_racun INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_racun)  ,
INDEX racun_FKIndex1(posiljka_id_posiljka)  ,
INDEX racun_FKIndex2(cenovnik_id_cenovnik),
  FOREIGN KEY(posiljka_id_posiljka)
    REFERENCES posiljka(id_posiljka)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(cenovnik_id_cenovnik)
    REFERENCES cenovnik(id_cenovnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




