CREATE TABLE uloga (
  id_uloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_uloga VARCHAR(50)  NULL    ,
PRIMARY KEY(id_uloga));



CREATE TABLE cenovnik (
  id_cenovnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  cena_dan DOUBLE  NULL  ,
  cena_start DOUBLE  NULL  ,
  datum_promene DATETIME  NULL  ,
  cena_noc DOUBLE  NULL    ,
PRIMARY KEY(id_cenovnik));



CREATE TABLE korisnik (
  id_korisnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  uloga_id_uloga INTEGER UNSIGNED  NOT NULL  ,
  prezime VARCHAR(100)  NULL  ,
  ime VARCHAR(100)  NULL  ,
  email VARCHAR(100)  NULL  ,
  telefon VARCHAR(100)  NULL  ,
  username VARCHAR(50)  NULL  ,
  pass VARCHAR(100)  NULL  ,
  obrisan INTEGER  NULL    ,
PRIMARY KEY(id_korisnik)  ,
INDEX korisnik_FKIndex1(uloga_id_uloga),
  FOREIGN KEY(uloga_id_uloga)
    REFERENCES uloga(id_uloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE voznja (
  id_voznja INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  korisnik_id_korisnik INTEGER UNSIGNED  NOT NULL  ,
  adresa_polazak VARCHAR(100)  NULL  ,
  vreme_polazak TIMESTAMP  NULL  ,
  telefon_mob VARCHAR(100)  NULL  ,
  adresa_cilj VARCHAR(100)  NULL  ,
  ukupno_km INTEGER  NULL  ,
  status_voznje VARCHAR(50)  NULL    ,
PRIMARY KEY(id_voznja)  ,
INDEX voznja_FKIndex1(korisnik_id_korisnik),
  FOREIGN KEY(korisnik_id_korisnik)
    REFERENCES korisnik(id_korisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE racun (
  id_racun INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  voznja_id_voznja INTEGER UNSIGNED  NOT NULL  ,
  cenovnik_id_cenovnik INTEGER UNSIGNED  NOT NULL  ,
  ukupan_racun DOUBLE  NULL    ,
PRIMARY KEY(id_racun)  ,
INDEX racun_FKIndex1(cenovnik_id_cenovnik)  ,
INDEX racun_FKIndex2(voznja_id_voznja),
  FOREIGN KEY(cenovnik_id_cenovnik)
    REFERENCES cenovnik(id_cenovnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(voznja_id_voznja)
    REFERENCES voznja(id_voznja)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




