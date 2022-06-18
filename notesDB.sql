CREATE TABLE osoba (
  id_osoba INTEGER   NOT NULL ,
  ime VARCHAR(50)    ,
  prezime VARCHAR(50)    ,
  username VARCHAR(200)    ,
  pass VARCHAR(1000)    ,
  email VARCHAR(500)      ,
PRIMARY KEY(id_osoba));




CREATE TABLE obaveza_tabela (
  id_obaveza INTEGER   NOT NULL ,
  osoba_id_osoba INTEGER   NOT NULL ,
  opis VARCHAR(2000)      ,
PRIMARY KEY(id_obaveza)  ,
  FOREIGN KEY(osoba_id_osoba)
    REFERENCES osoba(id_osoba));


CREATE INDEX obaveza_tabela_FKIndex1 ON obaveza_tabela (osoba_id_osoba);


CREATE INDEX IFK_Rel_02 ON obaveza_tabela (osoba_id_osoba);



