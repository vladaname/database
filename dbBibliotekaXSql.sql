CREATE TABLE Uloga (
  id_Uloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv VARCHAR(50)  NULL    ,
PRIMARY KEY(id_Uloga));



CREATE TABLE Zanr (
  id_Zanr INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv VARCHAR(50)  NULL    ,
PRIMARY KEY(id_Zanr));



CREATE TABLE Status_dela (
  id_Status_dela INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  datum_uzimanja DATETIME  NULL  ,
  datum_vracanja DATETIME  NULL  ,
  pozajmljeno BOOL  NULL    ,
PRIMARY KEY(id_Status_dela));



CREATE TABLE Korisnik (
  id_Korisnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Uloga_id_Uloga INTEGER UNSIGNED  NOT NULL  ,
  ime VARCHAR(50)  NULL  ,
  prezime VARCHAR(50)  NULL  ,
  email VARCHAR(100)  NULL  ,
  useranme VARCHAR(100)  NULL  ,
  pass VARCHAR(1000)  NULL    ,
PRIMARY KEY(id_Korisnik)  ,
INDEX Korisnik_FKIndex1(Uloga_id_Uloga),
  FOREIGN KEY(Uloga_id_Uloga)
    REFERENCES Uloga(id_Uloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Delo (
  id_Delo INTEGER UNSIGNED  NOT NULL  ,
  Korisnik_id_Korisnik INTEGER UNSIGNED  NOT NULL  ,
  Status_dela_id_Status_dela INTEGER UNSIGNED  NOT NULL  ,
  Zanr_id_Zanr INTEGER UNSIGNED  NOT NULL  ,
  naziv VARCHAR(50)  NULL  ,
  pisac VARCHAR(50)  NULL    ,
PRIMARY KEY(id_Delo)  ,
INDEX Delo_FKIndex1(Zanr_id_Zanr)  ,
INDEX Delo_FKIndex2(Status_dela_id_Status_dela)  ,
INDEX Delo_FKIndex3(Korisnik_id_Korisnik),
  FOREIGN KEY(Zanr_id_Zanr)
    REFERENCES Zanr(id_Zanr)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Status_dela_id_Status_dela)
    REFERENCES Status_dela(id_Status_dela)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Korisnik_id_Korisnik)
    REFERENCES Korisnik(id_Korisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




