SELECT * FROM pozoristedb.karta;

select count(*) as broj_prodatih_karata, p.naziv_predstave as predstava from karta as k
inner join predstava as p on
k.predstava_id_predstave = p.id_predstave
group by predstava order by broj_prodatih_karata desc limit 1;

/* prvo smo odredili sta cemo da kauntujemo (brojimo), zatim naziv usluge (kriterijum po kom cemo posle raditi
/* grupaciju.... ono po cemu grupisemo mora da se nalazi u selektu gore, nakon toga radimo sortiranje u opadajucem
/* redu i to po polju broj_prodatih_karata a limit jedan znaci da uzima samo prvi row iz tog rezultata
/* kada se radi dodatni filter upotrebljava se  havin a ne where
/* primer: 1,2,5 -> order by id desc -> 5,2,1 -> limit 1 -> 5