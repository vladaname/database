CREATE TABLE sala (
  id_sala INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_sale VARCHAR(255)  NULL  ,
  kapacitet_sale INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id_sala));



CREATE TABLE osoba (
  id_osoba INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  ime VARCHAR(255)  NULL  ,
  prezime VARCHAR(255)  NULL  ,
  email VARCHAR(30)  NULL  ,
  tel VARCHAR(30)  NULL    ,
PRIMARY KEY(id_osoba));



CREATE TABLE uloga (
  id_uloga INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_uloge VARCHAR(30)  NULL    ,
PRIMARY KEY(id_uloga));



CREATE TABLE status_karte (
  id_status_karte INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_stanja VARCHAR(255)  NULL    ,
PRIMARY KEY(id_status_karte));



CREATE TABLE kategorija (
  id_kategorija INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  naziv_kategorije VARCHAR(255)  NULL    ,
PRIMARY KEY(id_kategorija));



CREATE TABLE korisnik (
  id_korisnik INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  uloga_id_uloga INTEGER UNSIGNED  NOT NULL  ,
  osoba_id_osoba INTEGER UNSIGNED  NOT NULL  ,
  user_name VARCHAR(255)  NULL  ,
  pass VARCHAR(255)  NULL    ,
PRIMARY KEY(id_korisnik)  ,
INDEX korisnik_FKIndex1(osoba_id_osoba)  ,
INDEX korisnik_FKIndex2(uloga_id_uloga),
  FOREIGN KEY(osoba_id_osoba)
    REFERENCES osoba(id_osoba)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(uloga_id_uloga)
    REFERENCES uloga(id_uloga)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE predstava (
  id_predstave INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  sala_id_sala INTEGER UNSIGNED  NOT NULL  ,
  kategorija_id_kategorija INTEGER UNSIGNED  NOT NULL  ,
  naziv_predstave VARCHAR(45)  NOT NULL  ,
  vreme_od DATETIME  NULL  ,
  vreme_do DATETIME  NULL  ,
  opis VARCHAR(5000)  NULL  ,
  cena DOUBLE  NOT NULL  ,
  glumci VARCHAR(255)  NULL    ,
PRIMARY KEY(id_predstave)  ,
INDEX predstava_FKIndex1(kategorija_id_kategorija)  ,
INDEX predstava_FKIndex2(sala_id_sala),
  FOREIGN KEY(kategorija_id_kategorija)
    REFERENCES kategorija(id_kategorija)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(sala_id_sala)
    REFERENCES sala(id_sala)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE karta (
  id_karta INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  predstava_id_predstave INTEGER UNSIGNED  NOT NULL  ,
  status_karte_id_status_karte INTEGER UNSIGNED  NOT NULL  ,
  korisnik_id_korisnik INTEGER UNSIGNED  NOT NULL  ,
  vreme_rezervisanja DATETIME  NULL    ,
PRIMARY KEY(id_karta)  ,
INDEX karta_FKIndex1(korisnik_id_korisnik)  ,
INDEX karta_FKIndex2(status_karte_id_status_karte)  ,
INDEX karta_FKIndex3(predstava_id_predstave),
  FOREIGN KEY(korisnik_id_korisnik)
    REFERENCES korisnik(id_korisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(status_karte_id_status_karte)
    REFERENCES status_karte(id_status_karte)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(predstava_id_predstave)
    REFERENCES predstava(id_predstave)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE slike (
  id_slike INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  predstava_id_predstave INTEGER UNSIGNED  NOT NULL  ,
  naziv_slike VARCHAR(255)  NULL  ,
  link VARCHAR(255)  NULL    ,
PRIMARY KEY(id_slike)  ,
INDEX slike_FKIndex1(predstava_id_predstave),
  FOREIGN KEY(predstava_id_predstave)
    REFERENCES predstava(id_predstave)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE komentar (
  id_komentar INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  korisnik_id_korisnik INTEGER UNSIGNED  NOT NULL  ,
  predstava_id_predstave INTEGER UNSIGNED  NOT NULL  ,
  sadrzaj_komentara VARCHAR(1000)  NULL  ,
  vreme_objave_komentara DATETIME  NULL    ,
PRIMARY KEY(id_komentar)  ,
INDEX komentar_FKIndex1(predstava_id_predstave)  ,
INDEX komentar_FKIndex2(korisnik_id_korisnik),
  FOREIGN KEY(predstava_id_predstave)
    REFERENCES predstava(id_predstave)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(korisnik_id_korisnik)
    REFERENCES korisnik(id_korisnik)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




