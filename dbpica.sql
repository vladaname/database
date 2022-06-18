CREATE TABLE pica (
  idpica INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nazivPice VARCHAR(50)  NULL  ,
  cena INTEGER UNSIGNED  NULL  ,
  velicina INTEGER UNSIGNED  NULL  ,
  obrisan INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(idpica));



CREATE TABLE uloga (
  iduloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nazivUloge VARCHAR(40)  NULL    ,
PRIMARY KEY(iduloga));



CREATE TABLE korisnik (
  idkorisnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  uloga_iduloga INTEGER UNSIGNED  NOT NULL  ,
  ime VARCHAR(100)  NULL  ,
  prezime VARCHAR(100)  NULL  ,
  tel VARCHAR(30)  NULL  ,
  email VARCHAR(30)  NULL  ,
  username VARCHAR(30)  NULL  ,
  pass VARCHAR(1000)  NULL  ,
  adresa VARCHAR(100)  NULL    ,
PRIMARY KEY(idkorisnik)  ,
INDEX korisnik_FKIndex1(uloga_iduloga),
  FOREIGN KEY(uloga_iduloga)
    REFERENCES uloga(iduloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE racun (
  idracun INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  korisnik_idkorisnik INTEGER UNSIGNED  NOT NULL  ,
  ukupanRacun DOUBLE  NULL  ,
  vremeRacuna DATETIME  NULL  ,
  adresaIsporuke VARCHAR(100)  NULL    ,
PRIMARY KEY(idracun)  ,
INDEX racun_FKIndex1(korisnik_idkorisnik),
  FOREIGN KEY(korisnik_idkorisnik)
    REFERENCES korisnik(idkorisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE korpa (
  idkorpa INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  pica_idpica INTEGER UNSIGNED  NOT NULL  ,
  korisnik_idkorisnik INTEGER UNSIGNED  NOT NULL  ,
  kolicina INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(idkorpa)  ,
INDEX korpa_FKIndex1(korisnik_idkorisnik)  ,
INDEX korpa_FKIndex2(pica_idpica),
  FOREIGN KEY(korisnik_idkorisnik)
    REFERENCES korisnik(idkorisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(pica_idpica)
    REFERENCES pica(idpica)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE stavka (
  idstavka INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  pica_idpica INTEGER UNSIGNED  NOT NULL  ,
  racun_idracun INTEGER UNSIGNED  NOT NULL  ,
  kolicina INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(idstavka)  ,
INDEX stavka_FKIndex1(racun_idracun)  ,
INDEX stavka_FKIndex2(pica_idpica),
  FOREIGN KEY(racun_idracun)
    REFERENCES racun(idracun)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(pica_idpica)
    REFERENCES pica(idpica)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




