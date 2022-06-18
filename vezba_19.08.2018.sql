SELECT * FROM bibliotekadb.knjige;

select o.broj_telefona from knjige as k
inner join korisnik as ko on k.korisnik_idkorisnik = ko.idkorisnik
inner join osoba as o on ko.osoba_idosoba = o.idosoba
inner join uloga as ul on ko.uloga_iduloga = ul.iduloga
where ul.naziv_uloge = 'korisnik';