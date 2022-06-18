CREATE TABLE status_komentara (
  id_status_komentara INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_statusa VARCHAR(40)  NULL    ,
PRIMARY KEY(id_status_komentara));



CREATE TABLE uloga (
  id_uloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_uloge VARCHAR(50)  NULL    ,
PRIMARY KEY(id_uloga));



CREATE TABLE linija (
  id_linija INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_linije VARCHAR(100)  NULL  ,
  opis_linije VARCHAR(200)  NULL    ,
PRIMARY KEY(id_linija));



CREATE TABLE korisnik (
  id_korisnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  uloga_id_uloga INTEGER UNSIGNED  NOT NULL  ,
  ime VARCHAR(100)  NULL  ,
  prezime VARCHAR(100)  NULL  ,
  telefon VARCHAR(100)  NULL  ,
  email VARCHAR(100)  NULL  ,
  username VARCHAR(200)  NULL  ,
  pass VARCHAR(200)  NULL    ,
PRIMARY KEY(id_korisnik)  ,
INDEX korisnik_FKIndex1(uloga_id_uloga),
  FOREIGN KEY(uloga_id_uloga)
    REFERENCES uloga(id_uloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE red_voznje (
  id_red_voznje INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  linija_id_linija INTEGER UNSIGNED  NOT NULL  ,
  polazak_vreme DATETIME  NULL  ,
  dolazak_vreme DATETIME  NULL  ,
  ukupno_vreme_voznje DATETIME  NULL  ,
  radni_dan BOOL  NULL  ,
  subota BOOL  NULL  ,
  nedelja BOOL  NULL  ,
  obrisan INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_red_voznje)  ,
INDEX red_voznje_FKIndex1(linija_id_linija),
  FOREIGN KEY(linija_id_linija)
    REFERENCES linija(id_linija)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE komentar (
  id_komentar INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  status_komentara_id_status_komentara INTEGER UNSIGNED  NOT NULL  ,
  linija_id_linija INTEGER UNSIGNED  NOT NULL  ,
  korisnik_id_korisnik INTEGER UNSIGNED  NOT NULL  ,
  komentar VARCHAR(1000)  NULL  ,
  obrisan INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_komentar)  ,
INDEX komentar_FKIndex1(korisnik_id_korisnik)  ,
INDEX komentar_FKIndex2(linija_id_linija)  ,
INDEX komentar_FKIndex3(status_komentara_id_status_komentara),
  FOREIGN KEY(korisnik_id_korisnik)
    REFERENCES korisnik(id_korisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(linija_id_linija)
    REFERENCES linija(id_linija)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(status_komentara_id_status_komentara)
    REFERENCES status_komentara(id_status_komentara)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




