
SELECT @id_korisnika := 3;
SELECT p.* FROM predstava as p 
where p.kategorija_id_kategorija in 
(select p.kategorija_id_kategorija from karta k 
inner join predstava as p on k.predstava_id_predstave = p.id_predstave 
where k.korisnik_id_korisnik = @id_korisnika) 
and p.id_predstave not in 
(select p.id_predstave from karta k 
inner join predstava as p on k.predstava_id_predstave = p.id_predstave
where k.korisnik_id_korisnik = @id_korisnika) 
order by p.vreme_od desc;