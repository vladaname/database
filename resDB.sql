CREATE TABLE Roll (
  id_roll INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  roll_name VARCHAR(100)  NULL    ,
PRIMARY KEY(id_roll));



CREATE TABLE Korisnik (
  id_korisnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Roll_id_roll INTEGER UNSIGNED  NOT NULL  ,
  name VARCHAR(100)  NULL  ,
  email VARCHAR(100)  NULL  ,
  username VARCHAR(100)  NULL  ,
  pass VARCHAR(100)  NULL    ,
PRIMARY KEY(id_korisnik)  ,
INDEX Korisnik_FKIndex1(Roll_id_roll),
  FOREIGN KEY(Roll_id_roll)
    REFERENCES Roll(id_roll)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Restaurant (
  id_restaurant INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Korisnik_id_korisnik INTEGER UNSIGNED  NOT NULL  ,
  restaurant_name VARCHAR(100)  NULL  ,
  open_time DATETIME  NULL  ,
  close_time DATETIME  NULL    ,
PRIMARY KEY(id_restaurant)  ,
INDEX Restaurant_FKIndex1(Korisnik_id_korisnik),
  FOREIGN KEY(Korisnik_id_korisnik)
    REFERENCES Korisnik(id_korisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




