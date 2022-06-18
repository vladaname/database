CREATE TABLE Uloga (
  id_Uloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_uloge VARCHAR(100)  NULL    ,
PRIMARY KEY(id_Uloga));



CREATE TABLE Korisnik (
  id_Korisnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Uloga_id_Uloga INTEGER UNSIGNED  NOT NULL  ,
  ime VARCHAR(100)  NULL  ,
  prezime VARCHAR(100)  NULL  ,
  email VARCHAR(1000)  NULL  ,
  username VARCHAR(100)  NULL  ,
  pass VARCHAR(1000)  NULL    ,
PRIMARY KEY(id_Korisnik)  ,
INDEX Korisnik_FKIndex1(Uloga_id_Uloga),
  FOREIGN KEY(Uloga_id_Uloga)
    REFERENCES Uloga(id_Uloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Clanak (
  id_Clanak INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Korisnik_id_Korisnik INTEGER UNSIGNED  NOT NULL  ,
  tekst VARCHAR(2000)  NULL  ,
  lajkovi INTEGER UNSIGNED  NULL  ,
  naslov VARCHAR(100)  NULL    ,
PRIMARY KEY(id_Clanak)  ,
INDEX Clanak_FKIndex1(Korisnik_id_Korisnik),
  FOREIGN KEY(Korisnik_id_Korisnik)
    REFERENCES Korisnik(id_Korisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




