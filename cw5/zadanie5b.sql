select pensja.stanowisko, count(pracownicy.id_pracownika) from pensja inner join wynagrodzenie on 
pensja.id_pensji = wynagrodzenie.id_pensji inner join pracownicy on wynagrodzenie.id_pracownika = pracownicy.id_pracownika 
group by pensja.stanowisko;

select avg(pensja.kwota::numeric), min(pensja.kwota), max(pensja.kwota) from pensja where pensja.stanowisko = 'Priest';

select sum(pensja.kwota+premia.kwota) from pensja inner join premia on pensja.id_premii = premia.id_premii;

select pensja.stanowisko, sum(pensja.kwota+premia.kwota) from pensja inner join premia on 
pensja.id_premii = premia.id_premii group by pensja.stanowisko;

select pensja.stanowisko, count(premia.id_premii) from pensja inner join premia on 
pensja.id_premii = premia.id_premii group by pensja.stanowisko; 

delete from pracownicy using wynagrodzenie, pensja where pracownicy.id_pracownika = wynagrodzenie.id_pracownika and 
wynagrodzenie.id_pensji = pensja.id_pensji and pensja.kwota < '1200';