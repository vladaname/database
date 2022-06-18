CREATE TABLE Uloga (
  id_Uloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nameRool VARCHAR(100)  NULL    ,
PRIMARY KEY(id_Uloga));



CREATE TABLE Korisnik (
  id_Korisnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Uloga_id_Uloga INTEGER UNSIGNED  NOT NULL  ,
  name VARCHAR(100)  NULL  ,
  surname VARCHAR(100)  NULL  ,
  email VARCHAR(100)  NULL  ,
  username VARCHAR(100)  NULL  ,
  pass VARCHAR(1000)  NULL    ,
PRIMARY KEY(id_Korisnik)  ,
INDEX Korisnik_FKIndex1(Uloga_id_Uloga),
  FOREIGN KEY(Uloga_id_Uloga)
    REFERENCES Uloga(id_Uloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Trip (
  id_Trip INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Korisnik_id_Korisnik INTEGER UNSIGNED  NOT NULL  ,
  destination VARCHAR(100)  NULL  ,
  startDate DATETIME  NULL  ,
  endDate DATETIME  NULL  ,
  coment VARCHAR(1000)  NULL    ,
PRIMARY KEY(id_Trip)  ,
INDEX Trip_FKIndex1(Korisnik_id_Korisnik),
  FOREIGN KEY(Korisnik_id_Korisnik)
    REFERENCES Korisnik(id_Korisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




