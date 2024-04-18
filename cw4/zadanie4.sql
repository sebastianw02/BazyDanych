
create table pracownicy ("id_pracownika" serial primary key not null, 
"imie" varchar(50) not null, "nazwisko" varchar(50) not null, "adres" varchar(100), "telefon" varchar(20));
create table godziny ("id_godziny" serial primary key not null, "data" date not null, 
"liczba_godzin" integer not null, "id_pracownika" integer not null); 
create table pensje ("id_pensji" serial primary key not null, "stanowisko" varchar(50) not null, 
"kwota" money, "id_premii" integer not null); 
create table premie ("id_premii" serial primary key not null, "rodzaj" varchar(50) not null, "kwota" money);

alter table godziny add foreign key (id_pracownika) references pracownicy (id_pracownika);
alter table pensje add foreign key (id_premii) references premie (id_premii);

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

insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-01-20', '5', '1');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-02-21', '6', '2');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-03-22', '7', '3');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-04-23', '8', '4');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-05-24', '9', '5');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-06-25', '10', '6');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-07-26', '11', '7');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-08-27', '12', '8');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-09-28', '13', '9');
insert into godziny (data, liczba_godzin, id_pracownika) values ('2023-10-29', '14', '10');

insert into premie (rodzaj, kwota) values ('regulaminowa', '2900');
insert into premie (rodzaj, kwota) values ('indywidualna', '2000');
insert into premie (rodzaj, kwota) values ('motywacyjna', '2200');
insert into premie (rodzaj, kwota) values ('indywidualna', '2300');
insert into premie (rodzaj, kwota) values ('indywidualna', '2400');
insert into premie (rodzaj, kwota) values ('indywidualna', '2500');
insert into premie (rodzaj, kwota) values ('indywidualna', '2600');
insert into premie (rodzaj, kwota) values ('motywacyjna', '2700');
insert into premie (rodzaj, kwota) values ('motywacyjna', '2800');
insert into premie (rodzaj, kwota) values ('indywidualna', '2100');

insert into pensje (stanowisko, kwota, id_premii) values ('Priest', '17283', 1);
insert into pensje (stanowisko, kwota, id_premii) values ('Jockey', '7266', 2);
insert into pensje (stanowisko, kwota, id_premii) values ('Marketing director', '13545', 3);
insert into pensje (stanowisko, kwota, id_premii) values ('Lift engineer', '3453', 4);
insert into pensje (stanowisko, kwota, id_premii) values ('Chauffeur', '92324', 5);
insert into pensje (stanowisko, kwota, id_premii) values ('Historian', '94564', 6);
insert into pensje (stanowisko, kwota, id_premii) values ('Home-worker', '94564', 7);
insert into pensje (stanowisko, kwota, id_premii) values ('Legal secretary', '95474', 8);
insert into pensje (stanowisko, kwota, id_premii) values ('Grave digger', '96756', 9);
insert into pensje (stanowisko, kwota, id_premii) values ('Window cleaner', '92330', 10);

select pracownicy.nazwisko, pracownicy.adres from pracownicy; 

select date_part('day', godziny."data") as dzien, date_part('month', godziny."data") as miesiac from godziny;

alter table pensje rename column kwota to kwota_brutto; 
alter table pensje add column kwota_netto money;
update pensje set kwota_netto = kwota_brutto*0.8;