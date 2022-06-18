CREATE TABLE korisnik (
  id_korisnik INTEGER   NOT NULL ,
  ime VARCHAR(100)    ,
  prezime VARCHAR(100)    ,
  email VARCHAR(100)    ,
  username VARCHAR(100)    ,
  pass VARCHAR(1000)      ,
PRIMARY KEY(id_korisnik));




CREATE TABLE komentar (
  id_komentar INTEGER   NOT NULL ,
  korisnik_id_korisnik INTEGER   NOT NULL ,
  opis VARCHAR(2000)      ,
PRIMARY KEY(id_komentar)  ,
  FOREIGN KEY(korisnik_id_korisnik)
    REFERENCES korisnik(id_korisnik));


CREATE INDEX komentar_FKIndex1 ON komentar (korisnik_id_korisnik);


CREATE INDEX IFK_Rel_01 ON komentar (korisnik_id_korisnik);



