CREATE TABLE status_knjige (
  idstatus_knjige INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  stanje VARCHAR(20)  NULL    ,
PRIMARY KEY(idstatus_knjige));



CREATE TABLE osoba (
  idosoba INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  ime VARCHAR(20)  NULL  ,
  prezime VARCHAR(20)  NULL  ,
  broj_telefona VARCHAR(20)  NULL  ,
  email VARCHAR(20)  NULL    ,
PRIMARY KEY(idosoba));



CREATE TABLE kategorija (
  idkategorija INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_kategorije VARCHAR(20)  NULL    ,
PRIMARY KEY(idkategorija));



CREATE TABLE uloga (
  iduloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_uloge VARCHAR(20)  NULL    ,
PRIMARY KEY(iduloga));



CREATE TABLE korisnik (
  idkorisnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  osoba_idosoba INTEGER UNSIGNED  NOT NULL  ,
  uloga_iduloga INTEGER UNSIGNED  NOT NULL  ,
  username VARCHAR(20)  NULL  ,
  pass VARCHAR(20)  NULL    ,
PRIMARY KEY(idkorisnik)  ,
INDEX korisnik_FKIndex1(osoba_idosoba)  ,
INDEX korisnik_FKIndex2(uloga_iduloga),
  FOREIGN KEY(osoba_idosoba)
    REFERENCES osoba(idosoba)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(uloga_iduloga)
    REFERENCES uloga(iduloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE knjige (
  idknjige INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  korisnik_idkorisnik INTEGER UNSIGNED  NOT NULL  ,
  status_knjige_idstatus_knjige INTEGER UNSIGNED  NOT NULL  ,
  kategorija_idkategorija INTEGER UNSIGNED  NOT NULL  ,
  naziv VARCHAR(20)  NULL  ,
  pisac VARCHAR(20)  NULL  ,
  godina_izdanja INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(idknjige)  ,
INDEX knjige_FKIndex1(kategorija_idkategorija)  ,
INDEX knjige_FKIndex2(status_knjige_idstatus_knjige)  ,
INDEX knjige_FKIndex3(korisnik_idkorisnik),
  FOREIGN KEY(kategorija_idkategorija)
    REFERENCES kategorija(idkategorija)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(status_knjige_idstatus_knjige)
    REFERENCES status_knjige(idstatus_knjige)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(korisnik_idkorisnik)
    REFERENCES korisnik(idkorisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE komentar (
  idkomentar INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  knjige_idknjige INTEGER UNSIGNED  NOT NULL  ,
  korisnik_idkorisnik INTEGER UNSIGNED  NOT NULL  ,
  sadrzaj_komentara VARCHAR(1000)  NULL  ,
  vreme_objave DATETIME  NULL    ,
PRIMARY KEY(idkomentar)  ,
INDEX komentar_FKIndex1(korisnik_idkorisnik)  ,
INDEX komentar_FKIndex2(knjige_idknjige),
  FOREIGN KEY(korisnik_idkorisnik)
    REFERENCES korisnik(idkorisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(knjige_idknjige)
    REFERENCES knjige(idknjige)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




