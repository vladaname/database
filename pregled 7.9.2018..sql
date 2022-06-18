SELECT * FROM veterinardb.pregled;

select sum(cena), v.ime, v.prezime from pregled as p
inner join usluga as u on p.Usluga_idUsluga = u.idUsluga
inner join veterinar as v on p.Veterinar_idVeterinar = v.idVeterinar
group by ime;

select count(naziv) as broj_pregleda, ime, prezime from pregled as p
inner join usluga as u on p.Usluga_idUsluga = u.idUsluga
inner join veterinar as v on p.Veterinar_idVeterinar = v.idVeterinar
group by ime;

select count(naziv) as broj_pregleda, ime, prezime from pregled as p
inner join usluga as u on p.Usluga_idUsluga = u.idUsluga
inner join veterinar as v on p.Veterinar_idVeterinar = v.idVeterinar
where broj_pregleda < 2 group by ime; 
