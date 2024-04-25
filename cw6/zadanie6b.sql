update pracownicy set telefon = concat('(+48) ',telefon);

update pracownicy set telefon = concat(substring(telefon,1,9),'-',substring(telefon,10,3),'-',substring(telefon,13,3));

select upper(nazwisko) from pracownicy order by length(nazwisko) desc limit 1;

select pracownicy.imie, pracownicy.nazwisko, md5(pensja.kwota::varchar) from pracownicy inner join wynagrodzenie on
pracownicy.id_pracownika = wynagrodzenie.id_pracownika inner join pensja on pensja.id_pensji = wynagrodzenie.id_pensji;

select pracownicy.imie, pracownicy.nazwisko, pensja.kwota, premia.kwota from pracownicy left join wynagrodzenie on
pracownicy.id_pracownika = wynagrodzenie.id_pracownika left join pensja on pensja.id_pensji = wynagrodzenie.id_pensji
left join premia on premia.id_premii = pensja.id_premii;

select concat('Pracownik ',pracownicy.imie,' ',pracownicy.nazwisko,', w dniu ',wynagrodzenie."data",
' otrzymał pensję całkowitą na kwotę ',pensja.kwota+premia.kwota,', gdzie wynagrodzenie zasadnicze wynosiło: ',
pensja.kwota,' zł, premia: ',premia.kwota,' zł, nadgodziny: ',godziny.liczba_godzin) 
from pracownicy inner join godziny on pracownicy.id_pracownika = godziny.id_pracownika inner join wynagrodzenie on 
godziny.id_godziny  = wynagrodzenie.id_godziny inner join pensja on wynagrodzenie.id_pensji = pensja.id_pensji inner join 
premia on premia.id_premii = pensja.id_premii;