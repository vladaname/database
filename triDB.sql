CREATE TABLE Uloga (
  idUloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nameRool VARCHAR(100)  NULL    ,
PRIMARY KEY(idUloga));



CREATE TABLE Korisnik (
  idKorisnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Uloga_idUloga INTEGER UNSIGNED  NOT NULL  ,
  name VARCHAR(100)  NULL  ,
  surename VARCHAR(100)  NULL  ,
  email VARCHAR(100)  NULL  ,
  username VARCHAR(100)  NULL  ,
  pass VARCHAR(1000)  NULL    ,
PRIMARY KEY(idKorisnik)  ,
INDEX Korisnik_FKIndex1(Uloga_idUloga),
  FOREIGN KEY(Uloga_idUloga)
    REFERENCES Uloga(idUloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Trip (
  idTrip INTEGER  NOT NULL   AUTO_INCREMENT,
  Korisnik_idKorisnik INTEGER UNSIGNED  NOT NULL  ,
  destination VARCHAR(100)  NULL  ,
  startDate DATETIME  NULL  ,
  endDate DATETIME  NULL  ,
  coment VARCHAR(1000)  NULL    ,
PRIMARY KEY(idTrip)  ,
INDEX Trip_FKIndex1(Korisnik_idKorisnik),
  FOREIGN KEY(Korisnik_idKorisnik)
    REFERENCES Korisnik(idKorisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




