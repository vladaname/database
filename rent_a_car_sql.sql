CREATE TABLE korisnik (
  idkorisnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  ime VARCHAR(100)  NULL  ,
  prezime VARCHAR(100)  NULL  ,
  telefon VARCHAR(20)  NULL  ,
  email VARCHAR(50)  NULL  ,
  username VARCHAR(20)  NULL  ,
  pass VARCHAR(50)  NULL    ,
PRIMARY KEY(idkorisnik));



CREATE TABLE automobil (
  idautomobil INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  marka VARCHAR(50)  NULL  ,
  model VARCHAR(20)  NULL  ,
  kubikaza INTEGER UNSIGNED  NULL  ,
  broj_vrata INTEGER UNSIGNED  NULL  ,
  gorivo VARCHAR(20)  NULL  ,
  cena_po_danu INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(idautomobil));



CREATE TABLE uloga (
  iduloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  korisnik_idkorisnik INTEGER UNSIGNED  NOT NULL  ,
  naziv VARCHAR(50)  NULL    ,
PRIMARY KEY(iduloga)  ,
INDEX uloga_FKIndex1(korisnik_idkorisnik),
  FOREIGN KEY(korisnik_idkorisnik)
    REFERENCES korisnik(idkorisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE iznajmljivanje (
  idiznajmljivanje INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  automobil_idautomobil INTEGER UNSIGNED  NOT NULL  ,
  korisnik_idkorisnik INTEGER UNSIGNED  NOT NULL  ,
  datum_od DATETIME  NULL  ,
  datum_do DATETIME  NULL    ,
PRIMARY KEY(idiznajmljivanje)  ,
INDEX iznajmljivanje_FKIndex1(korisnik_idkorisnik)  ,
INDEX iznajmljivanje_FKIndex2(automobil_idautomobil),
  FOREIGN KEY(korisnik_idkorisnik)
    REFERENCES korisnik(idkorisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(automobil_idautomobil)
    REFERENCES automobil(idautomobil)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




