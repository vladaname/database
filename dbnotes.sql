CREATE TABLE Osoba (
  id_Osoba INTEGER   NOT NULL ,
  ime VARCHAR(100)    ,
  prezime VARCHAR(100)    ,
  email VARCHAR(100)    ,
  username VARCHAR(100)    ,
  pass VARCHAR(1000)      ,
PRIMARY KEY(id_Osoba));




CREATE TABLE Notes (
  id_Notes INTEGER   NOT NULL ,
  Osoba_id_Osoba INTEGER   NOT NULL ,
  opis VARCHAR(2000)      ,
PRIMARY KEY(id_Notes)  ,
  FOREIGN KEY(Osoba_id_Osoba)
    REFERENCES Osoba(id_Osoba));


CREATE INDEX Notes_FKIndex1 ON Notes (Osoba_id_Osoba);


CREATE INDEX IFK_Rel_01 ON Notes (Osoba_id_Osoba);



