CREATE TABLE Korisnik (
  id_Korisnik INTEGER   NOT NULL ,
  ime VARCHAR(100)    ,
  prezime VARCHAR(100)    ,
  email VARCHAR(1000)    ,
  username VARCHAR(100)    ,
  pass VARCHAR(1000)      ,
PRIMARY KEY(id_Korisnik));




CREATE TABLE Komentar (
  id_Komentar INTEGER   NOT NULL ,
  Korisnik_id_Korisnik INTEGER   NOT NULL ,
  tekst VARCHAR(2000)    ,
  naslov VARCHAR(100)      ,
PRIMARY KEY(id_Komentar)  ,
  FOREIGN KEY(Korisnik_id_Korisnik)
    REFERENCES Korisnik(id_Korisnik));


CREATE INDEX Clanak_FKIndex1 ON Komentar (Korisnik_id_Korisnik);


CREATE INDEX IFK_Rel_02 ON Komentar (Korisnik_id_Korisnik);



