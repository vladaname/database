CREATE TABLE osobe (
  id_osobe INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  ime VARCHAR(45)  NOT NULL  ,
  prezime VARCHAR(45)  NOT NULL  ,
  datum_rodjenja DATE  NULL  ,
  radni_staz INTEGER UNSIGNED  NULL  ,
  broj_telefona VARCHAR(20)  NULL  ,
  email VARCHAR(255)  NULL    ,
PRIMARY KEY(id_osobe));




