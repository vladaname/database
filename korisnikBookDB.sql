CREATE TABLE uloga (
  id_uloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv VARCHAR(100)  NULL    ,
PRIMARY KEY(id_uloga));



CREATE TABLE korisnik (
  id_korisnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  uloga_id_uloga INTEGER UNSIGNED  NOT NULL  ,
  name VARCHAR(100)  NULL  ,
  last_name VARCHAR(100)  NULL  ,
  username VARCHAR(100)  NULL  ,
  pass VARCHAR(1000)  NULL  ,
  email VARCHAR(200)  NULL    ,
PRIMARY KEY(id_korisnik)  ,
INDEX korisnik_FKIndex1(uloga_id_uloga),
  FOREIGN KEY(uloga_id_uloga)
    REFERENCES uloga(id_uloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE biblioteka (
  id_biblioteka INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  korisnik_id_korisnik INTEGER UNSIGNED  NOT NULL  ,
  book_name VARCHAR(100)  NULL  ,
  book_author VARCHAR(100)  NULL  ,
  book_price INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_biblioteka)  ,
INDEX biblioteka_FKIndex1(korisnik_id_korisnik),
  FOREIGN KEY(korisnik_id_korisnik)
    REFERENCES korisnik(id_korisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




