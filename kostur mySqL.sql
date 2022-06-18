SELECT * FROM pozoristedb.karta;

select sum(p.cena) as ukupna_zarada, a.naziv_sale as sala from karta as k
inner join predstava as p on
k.predstava_id_predstave = p.id_predstave
inner join status_karte as s on
k.status_karte_id_status_karte = s.id_status_karte
inner join sala as a on
p.sala_id_sala = a.id_sala
where s.naziv_stanja = 'prodato' and
k.vreme_rezervisanja between '2018-01-01' and now()
group by sala;

/*select *polja koja selektujemo* from *naziv tabele* inner join *tabela* on *sta se mecuje* inner join... inner join...
/* where *uslov* and *uslov* or *uslov* group by *polje iz selecta* having *uslov isto kao where samo nad vec filtriranim podacima*
/* order by *polje* asc , *polje* desc , limit *broj* / offset *broj* take *broj*
