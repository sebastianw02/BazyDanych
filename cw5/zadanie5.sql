create schema ksiegowosc;

create table pracownicy ("id_pracownika" serial primary key not null, 
"imie" varchar(50) not null, "nazwisko" varchar(50) not null, "adres" varchar(100), "telefon" varchar(20));
create table godziny ("id_godziny" serial primary key not null, "data" date not null, 
"liczba_godzin" integer not null, "id_pracownika" integer not null); 
create table pensja ("id_pensji" serial primary key not null, "stanowisko" varchar(50) not null, 
"kwota" money, "id_premii" integer not null); 
create table premia ("id_premii" serial primary key not null, "rodzaj" varchar(50) not null, "kwota" money);
create table wynagrodzenie ("id_wynagrodzenia" serial primary key not null, "data" date not null, 
"id_pracownika" integer not null, "id_godziny" integer not null, "id_pensji" integer not null,
"id_premii" integer not null);

alter table godziny add foreign key (id_pracownika) references pracownicy (id_pracownika);
alter table pensja add foreign key (id_premii) references premia (id_premii);
alter table wynagrodzenie  add foreign key (id_pracownika) references pracownicy (id_pracownika);
alter table wynagrodzenie  add foreign key (id_godziny) references godziny (id_godziny);
alter table wynagrodzenie  add foreign key (id_pensji) references pensja (id_pensji);
alter table wynagrodzenie  add foreign key (id_premii) references premia (id_premii);

comment on table pracownicy is 'Tabela zawierająca informacje o zatrudnionych osobach.';
comment on table godziny is 'Tabela obejmująca czasy i daty skorelowane z tabelą pracownicy.';
comment on table pensja is 'Tabela zawierająca informacje o stanowisku pracy i wysokości wynagrodzenia, powiązana z tabelą premia.';
comment on table premia is 'Tabela zawierająca informacje o przyznawanych premiach.';
comment on table wynagrodzenie is 'Tabela obejmująca daty, powiązana z tabelami pracownicy, godziny, pensja i premia.';

insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Karol', 'Jasiński', 'Kraków ul. Wiosenna 15', '333666999');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Izabela', 'Piotrowska', 'Kraków ul. Słowackiego 28', '222555888');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Krzysztof', 'Nowacki', 'Kraków ul. Krakowska 39', '111444777');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Monika', 'Kowalczyk', 'Kraków ul. Mickiewicza 47', '000333666');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Artur', 'Wiśniewski', 'Kraków ul. Leśna 56', '444777000');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Alicja', 'Kamińska', 'Kraków ul. Rycerska 68', '777000333');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Rafał', 'Duda', 'Kraków ul. Polna 77', '222555888');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Patrycja', 'Lewandowska', 'Kraków ul. Jagiellońska 88', '555888111');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Tadeusz', 'Zając', 'Kraków ul. Krótka 99', '888111444');
insert into pracownicy (imie, nazwisko, adres, telefon) values 
('Aneta', 'Sikora', 'Kraków ul. Prosta 100', '111444777');

insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-01-20', '240', '1');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-02-21', '170', '2');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-03-22', '150', '3');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-04-23', '700', '4');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-05-24', '100', '5');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-06-25', '130', '6');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-07-26', '110', '7');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-08-27', '300', '8');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-09-28', '90', '9');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-10-29', '10', '10');

insert into premia  (rodzaj, kwota) values ('regulaminowa', '2900');
insert into premia (rodzaj, kwota) values ('indywidualna', '2000');
insert into premia (rodzaj, kwota) values ('motywacyjna', '2200');
insert into premia (rodzaj, kwota) values ('indywidualna', '2300');
insert into premia (rodzaj, kwota) values ('indywidualna', '2400');
insert into premia (rodzaj, kwota) values ('indywidualna', '2500');
insert into premia (rodzaj, kwota) values ('indywidualna', '2600');
insert into premia (rodzaj, kwota) values ('motywacyjna', '2700');
insert into premia (rodzaj, kwota) values ('motywacyjna', '2800');
insert into premia (rodzaj, kwota) values ('indywidualna', '2100');

insert into pensja (stanowisko, kwota, id_premii) values ('Priest', '17283', 1);
insert into pensja (stanowisko, kwota, id_premii) values ('Jockey', '7266', 2);
insert into pensja (stanowisko, kwota, id_premii) values ('Marketing director', '13545', 3);
insert into pensja (stanowisko, kwota, id_premii) values ('Lift engineer', '3453', 4);
insert into pensja (stanowisko, kwota, id_premii) values ('Chauffeur', '92324', 5);
insert into pensja (stanowisko, kwota, id_premii) values ('Historian', '94564', 6);
insert into pensja (stanowisko, kwota, id_premii) values ('Home-worker', '94564', 7);
insert into pensja (stanowisko, kwota, id_premii) values ('Legal secretary', '95474', 8);
insert into pensja (stanowisko, kwota, id_premii) values ('Grave digger', '96756', 9);
insert into pensja (stanowisko, kwota, id_premii) values ('Window cleaner', '92330', 10);

insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-01-20', '1', '1', '1', '1');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-02-21', '2', '2', '2', '2');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-03-22', '3', '3', '3', '3');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-04-23', '4', '4', '4', '4');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-05-24', '5', '5', '5', '5');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-06-25', '6', '6', '6', '6');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-07-26', '7', '7', '7', '7');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-08-27', '8', '8', '8', '8');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-09-28', '9', '9', '9', '9');
insert into wynagrodzenie  (data, id_pracownika , id_godziny, id_pensji, id_premii) values (
'2023-10-29', '10', '10', '10', '10');


select pracownicy.id_pracownika, pracownicy.nazwisko from pracownicy; 

select pracownicy.id_pracownika, pensja.kwota from pracownicy inner join wynagrodzenie on 
pracownicy.id_pracownika = wynagrodzenie.id_pracownika inner join pensja on 
wynagrodzenie.id_pensji = pensja.id_pensji where pensja.kwota > '1000';

select pracownicy.id_pracownika, pensja.kwota as pensja, premia.kwota as premia from pracownicy inner join
wynagrodzenie on pracownicy.id_pracownika = wynagrodzenie.id_pracownika inner join pensja on
wynagrodzenie.id_pensji = pensja.id_pensji inner join premia on premia.id_premii = pensja.id_premii 
where pensja.kwota > '2000' and premia.kwota is NULL;

select * from pracownicy where pracownicy.imie like 'J%';

select * from pracownicy where pracownicy.imie like 'N%' and pracownicy.imie like '%a';

select pracownicy.imie, pracownicy.nazwisko, (godziny.liczba_godzin-160) as nadgodziny from pracownicy inner join
godziny on godziny.id_pracownika = pracownicy.id_pracownika where godziny.liczba_godzin > '160';

select pracownicy.imie, pracownicy.nazwisko, pensja.kwota from pracownicy inner join wynagrodzenie on 
pracownicy.id_pracownika = wynagrodzenie.id_pracownika inner join pensja on 
wynagrodzenie.id_pensji = pensja.id_pensji where pensja.kwota between '1500' and '3000'; 

select pracownicy.imie, pracownicy.nazwisko, (godziny.liczba_godzin-160) as nadgodziny from pracownicy inner join
godziny on pracownicy.id_pracownika = godziny.id_pracownika inner join wynagrodzenie on 
godziny.id_godziny  = wynagrodzenie.id_godziny inner join pensja on wynagrodzenie.id_pensji = pensja.id_pensji inner join 
premia on premia.id_premii = pensja.id_premii where premia.kwota is null and godziny.liczba_godzin > '160';

select pensja.kwota, pracownicy.* from pracownicy inner join wynagrodzenie on pracownicy.id_pracownika = wynagrodzenie.id_pracownika 
inner join pensja on wynagrodzenie.id_pensji = pensja.id_pensji order by pensja.kwota;

select pensja.kwota as pensja, premia.kwota as premia, pracownicy.* from pracownicy inner join
wynagrodzenie on pracownicy.id_pracownika = wynagrodzenie.id_pracownika inner join pensja on
wynagrodzenie.id_pensji = pensja.id_pensji inner join premia on premia.id_premii = pensja.id_premii 
order by pensja.kwota, premia.kwota desc;


