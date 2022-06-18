CREATE TABLE Uloga (
  id_Uloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv VARCHAR(100)  NULL    ,
PRIMARY KEY(id_Uloga));



CREATE TABLE Osoba (
  id_Osoba INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Uloga_id_Uloga INTEGER UNSIGNED  NOT NULL  ,
  ime VARCHAR(100)  NULL  ,
  prezime VARCHAR(100)  NULL  ,
  email VARCHAR(100)  NULL  ,
  username VARCHAR(100)  NULL  ,
  pass VARCHAR(1000)  NULL    ,
PRIMARY KEY(id_Osoba)  ,
INDEX Osoba_FKIndex1(Uloga_id_Uloga),
  FOREIGN KEY(Uloga_id_Uloga)
    REFERENCES Uloga(id_Uloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Notes (
  id_Notes INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Osoba_id_Osoba INTEGER UNSIGNED  NOT NULL  ,
  opis VARCHAR(2000)  NULL    ,
PRIMARY KEY(id_Notes)  ,
INDEX Notes_FKIndex1(Osoba_id_Osoba),
  FOREIGN KEY(Osoba_id_Osoba)
    REFERENCES Osoba(id_Osoba)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




