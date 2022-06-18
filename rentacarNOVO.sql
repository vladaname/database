SELECT * FROM rentacardb.iznajmljivanje;

select a.idautomobil, datum_do, a.marka, a.model from iznajmljivanje as iz
inner join automobil as a on iz.automobil_idautomobil = a.idautomobil
where a.idautomobil = idautomobil;

select ((TO_DAYS(datum_do) - TO_DAYS(datum_od)) * sum(cena_po_danu))AS ukupna_cena, sum(cena_po_danu)
 as cena_po_danu, datum_od, datum_do, a.model, a.marka from iznajmljivanje as i
inner join automobil as a on i.automobil_idautomobil = a.idautomobil
group by a.model;

SELECT TO_DAYS(datum_od) - TO_DAYS(datum_do) AS trajanje FROM iznajmljivanje;

select distinct;