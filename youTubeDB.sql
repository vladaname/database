CREATE TABLE korisnik (
  id_korisnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  username VARCHAR(100)  NULL  ,
  pass VARCHAR(1000)  NULL    ,
PRIMARY KEY(id_korisnik));



CREATE TABLE akaunt (
  id_akaunt INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  korisnik_id_korisnik INTEGER UNSIGNED  NOT NULL  ,
  ime VARCHAR(100)  NULL  ,
  prezime VARCHAR(100)  NULL  ,
  nick VARCHAR(100)  NULL  ,
  adresa VARCHAR(100)  NULL  ,
  godine INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_akaunt)  ,
INDEX akaunt_FKIndex1(korisnik_id_korisnik),
  FOREIGN KEY(korisnik_id_korisnik)
    REFERENCES korisnik(id_korisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE video (
  id_video INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  akaunt_id_akaunt INTEGER UNSIGNED  NOT NULL  ,
  link VARCHAR(1000)  NULL  ,
  naslov VARCHAR(500)  NULL  ,
  opis VARCHAR(1000)  NULL  ,
  br_lajkova INTEGER UNSIGNED  NULL  ,
  br_dislajkova INTEGER UNSIGNED  NULL  ,
  logicko_brisanje INTEGER UNSIGNED  NULL  ,
  uzrast INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_video)  ,
INDEX video_FKIndex1(akaunt_id_akaunt),
  FOREIGN KEY(akaunt_id_akaunt)
    REFERENCES akaunt(id_akaunt)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE komentar (
  id_komentar INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  akaunt_id_akaunt INTEGER UNSIGNED  NOT NULL  ,
  video_id_video INTEGER UNSIGNED  NOT NULL  ,
  sadrzaj VARCHAR(500)  NULL  ,
  br_lajkova INTEGER UNSIGNED  NULL  ,
  br_dislajkova INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_komentar)  ,
INDEX komentar_FKIndex2(video_id_video)  ,
INDEX komentar_FKIndex1(akaunt_id_akaunt),
  FOREIGN KEY(video_id_video)
    REFERENCES video(id_video)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(akaunt_id_akaunt)
    REFERENCES akaunt(id_akaunt)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




