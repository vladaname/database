CREATE TABLE veterinar (
  id_veterinar INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  ime VARCHAR(45)  NULL  ,
  prezime VARCHAR(45)  NULL    ,
PRIMARY KEY(id_veterinar));



CREATE TABLE usluga (
  id_usluga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_usluge VARCHAR(45)  NULL  ,
  cena INT  NULL    ,
PRIMARY KEY(id_usluga));



CREATE TABLE pregled (
  id_pregled INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  usluga_id_usluga INTEGER UNSIGNED  NOT NULL  ,
  veterinar_id_veterinar INTEGER UNSIGNED  NOT NULL  ,
  vreme_od DATETIME  NULL  ,
  vreme_do DATETIME  NULL  ,
  zauzeto INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_pregled)  ,
INDEX pregled_FKIndex1(veterinar_id_veterinar)  ,
INDEX pregled_FKIndex2(usluga_id_usluga),
  FOREIGN KEY(veterinar_id_veterinar)
    REFERENCES veterinar(id_veterinar)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(usluga_id_usluga)
    REFERENCES usluga(id_usluga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




