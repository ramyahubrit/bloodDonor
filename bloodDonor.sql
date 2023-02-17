use dsp;
create table Donar(ID Integer,NAME varchar(255),GENDER Character,CITY varchar(255),BLOOD_GROUP varchar(255),Amount integer);	
create table Acceptor like donar;

insert into donar values(1,'MARIA','F','Warne, NH','AB+',7),(2,'DOROTHY','F','East Natchitoches, PA','AB+',3),
(3,'CHARLES','M','East Natchitoches, PA','A-',6),
(4,'DOROTHY','F','East Natchitoches, PA','AB+',9),
(5,'MICHAEL','M','Warne, NH','A+',1);

insert into acceptor values(1,'LINDA','F','Warne, NH','A+',9),
(2,'CHARLES','M','Warne, NH','AB+',8),
(3,'RICHARD','M','East Natchitoches, PA','AB+',3),
(4,'LINDA','F','East Natchitoches, PA','A+',1),
(5,'PATRICIA','F','Warne, NH','A+',5);


with a (city, tot) as (
	select city,sum(amount) from acceptor group by city
),d (city,tot) as(
select city,sum(amount) from donar group by city
),res(a,b) as (
select a.city,round(d.tot/a.tot,4)from a join d on a.city = d.city
)select a as city,b as ratio from res where b=(select max(b) from res) or b=(select min(b) from res) ; 
