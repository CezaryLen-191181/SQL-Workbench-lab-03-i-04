/*

desc zadanie

drop table projekt, zadanie

alter table t
add column x DATE,
drop column x;

update pracownik set imie = 'gregory',nazwisko = 'bronzowy' where id_pracownika = 1
*/
create table pracownik (
	id_pracownika int primary key auto_increment,
    imie varchar(40) not null,
    nazwisko varchar(60) not null,
    data_urodzenia date	not null
);
insert into pracownik (imie,nazwisko,data_urodzenia)
values ('szymon','erd', '1998-09-02'),
	 ('zbigniew','11', '1998-09-02'), ('emon','szyrd', '2012-12-12');
update pracownik set data_urodzenia = '2007-10-27' where id_pracownika = 1;

create table zadanie (
	id_zadania int primary key auto_increment,
    nazwa_zadania varchar(150) not null,
	priorytet enum('normalny','wysoki','niski') not null,
    opis longtext,
    pracownik int,
    foreign key (pracownik)
        references pracownik(id_pracownika) on delete set null
);



create table projekt (
	id_projektu int primary key auto_increment,
    nazwa_projektu varchar(150),
	data_rozpoczecia date not null,
    data_zakonczenia date
);

alter table projekt 
add column menadzer_projektu int,
add foreign key (menadzer_projektu) references pracownik(id_pracownika);

alter table zadanie 
add column projekt int,
add foreign key (projekt) references projekt(id_projektu) on delete cascade;

create table sprint (
	id_sprintu int primary key auto_increment,
    numer_sprintu int unsigned,
    data_rozpoczecia date,
    data_zakonczenia date
);

alter table zadanie
add column sprint int null,
add foreign key (sprint) references sprint(id_sprintu) on delete set null;

create table status (
	id_statusu int primary key auto_increment,
    nazwa_statusu varchar(20)
);

create table zadanie_has_status (
	id_zdarzenia int primary key auto_increment,
	id_zadania int, foreign key (id_zadania) references zadanie(id_zadania),
    id_statusu int, foreign key (id_statusu) references status(id_statusu),
    data_zdarzenia datetime default(current_timestamp())
);
insert into projekt (nazwa_projektu,data_rozpoczecia) values ('sawdawdawdawd1','1999-12-23'), ('sdawdawdwd2',current_date()),('sqwdawdawdas3',current_date()); 
insert into zadanie (nazwa_zadania, opis,projekt)
values ('123','ewawaeaweawe',1), ('456','eeeeeeeeeeeeee',3);
drop table sprint;
select * from projekt;
select * from zadanie;

delete from projekt where id_projektu = 1;

ALTER TABLE pracownik modify id_pracownika int auto_increment primary key;
alter table projekt drop column menadzer_projektu;

alter table zadanie 
add foreign key (projekt) references projekt(id_projektu) on delete cascade;

alter table projekt 
add foreign key (menadzer_projektu) references pracownik(id_pracownika);

-- zadanie lab4 2

alter table zadanie 
add column godziny_szacowane integer default(8);

update zadanie set godziny_szacowane = 16 where id_zadania = 4;

alter table zadanie alter column godziny_szacowane set default 6;

insert into zadanie (nazwa_zadania) values ('sprawdzam domyslna');

select * from zadanie;

delete from zadanie where id_zadania = 7;

-- zadanie lab4 3

alter table projekt 
add column opis_kratki varchar(50) null;

alter table projekt
modify column opis_kratki varchar(200) null;

update projekt set opis_kratki = 'MVP' where id_projektu = 2;
select * from projekt;

alter table projekt drop column opis_kratki;

-- zadanie lab4 4

alter table zadanie
drop foreign key zadanie_ibfk_2;

alter table zadanie
add foreign key (projekt) references projekt(id_projektu) on delete set null;

delete from projekt where id_projektu = 3;



