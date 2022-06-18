CREATE TABLE osoba (
  id_osoba INTEGER   NOT NULL ,
  ime VARCHAR(100)    ,
  prezime VARCHAR(100)    ,
  email VARCHAR(100)    ,
  username VARCHAR(100)    ,
  pass VARCHAR(1000)      ,
PRIMARY KEY(id_osoba));




CREATE TABLE komentar (
  id_komentar INTEGER   NOT NULL ,
  osoba_id_osoba INTEGER   NOT NULL ,
  opis VARCHAR(2000)      ,
PRIMARY KEY(id_komentar)  ,
  FOREIGN KEY(osoba_id_osoba)
    REFERENCES osoba(id_osoba));


CREATE INDEX komentar_FKIndex1 ON komentar (osoba_id_osoba);


CREATE INDEX IFK_Rel_01 ON komentar (osoba_id_osoba);



