create database kindergartenManagement;
use  kindergartenManagement;
drop database kindergartenManagement;


create table Adults(
aid int not null auto_increment primary key,
firstname varchar(30) not null,
lastname varchar(30) not null,
gender enum('M','F'),
email varchar(50) null,
phoneNumber varchar(10) null,
username varchar(20) not null,
password varchar(30) not null,
created_at timestamp default current_timestamp not null,
updated_at timestamp,
INDEX fnameAdults_index (firstname ASC) visible
);

select * from Adults;
insert into Adults (firstname, lastname, gender, email, phoneNumber, username, password) 
				value('Arta', 'Gashi', 'F', 'artagashi@gmail.com', '049123456', 'artagashi', '123456');
insert into Adults (firstname, lastname, gender, email, phoneNumber, username, password) 
				values('Andi', 'Aliu', 'M', 'andialiu@gmail.com', '044222333', 'andialiu', 'test123'),
					  ('Mali', 'Uka', 'M', 'maliuka@hotmail.com', '044111456', 'maliuka', '54321');
                
create table Roles(
rid int not null primary key auto_increment,
name char(10)
);

select * from Roles;
insert into Roles (name) values ('manager'),
							    ('parent');

create table Adults_Roles(
adultid int not null,
roleid int not null,
description varchar(50),
-- primary key(adultid, roleid), 
foreign key (adultid) references Adults(aid) on delete cascade on update cascade,
foreign key (roleid) references Roles(rid) on delete cascade on update cascade
);

alter table Adults_Roles modify column description varchar(50);

select * from Adults_Roles;
insert into Adults_Roles (adultid, roleid, description) 
				  values (3, 1, 'Menaxheri CRUD operations'),
					     (2,2, 'Prindi lexon te dhenat e femiut'),
                         (1,2, 'Prindi lexon te dhenat e femiut');

select ar.adultid, ar.roleid, a.firstname, a.lastname, r.name from adults_roles ar
inner join adults a on ar.adultid = a.aid
inner join roles r on ar.roleid = r.rid;

create table Permissions(
pid int not null primary key auto_increment,
name varchar(30)
);

select * from Permissions;
insert into Permissions (name) values ('CRUD'),
									  ('Read');	

create table Permissions_Roles(
permissionid int not null,
roleid int not null,
-- primary key(permissionid, roleid),
foreign key (permissionid) references Permissions(pid) on delete cascade on update cascade,
foreign key (roleid) references Roles(rid) on delete cascade on update cascade
);

select * from Permissions_Roles;
insert into Permissions_Roles values (1,1),
									 (2,2);
                                  
select pr.permissionid, pr.roleid, p.name, r.name from Permissions_Roles pr
inner join permissions p on pr.permissionid = p.pid
inner join roles r on pr.roleid = r.rid;                                      


create table Address(
aid int not null primary key auto_increment,
adultid int not null,
country varchar(20),
city varchar(20),
street varchar(40),
zipcode varchar(10),
foreign key (adultid) references Adults(aid)
);

select * from Address;
insert into Address (adultid, country, city, street, zipcode) 
				values (1, 'Kosova','Prishtina','Agim Ramadani', '10000'),
					   (2, 'Kosova', 'Prishtina','Rexhep Mala', '10000'),
                       (3, 'Kosova','Prishtina','Ukshin Hoti', '10000');

create table Class(
cid int not null auto_increment primary key,
classNumber varchar(10),
actualNumber int not null,
maxNumber int,
created_at timestamp default current_timestamp not null,
updated_at timestamp
);

select * from Class;
insert into Class (classNumber, actualNumber, maxNumber) values ('1b', 3, 10);
insert into Class (classNumber, actualNumber, maxNumber) values ('2a', 2, 10);

create table Children(
cid int primary key auto_increment not null,
adultid int not null,
classid int null,
firstname varchar(20),
lastname varchar(20),
gender enum('M','F'),
image varchar(200),
age datetime,
created_at timestamp default current_timestamp not null,
updated_at timestamp,
foreign key (adultid) references Adults(aid) on delete cascade on update cascade,
foreign key (classid) references Class(cid) on delete set null on update cascade,
INDEX fnameChildren_index (firstname ASC) visible
);

alter table Children modify column birthdate date;
describe children;
select * from children;
insert into children (adultid, classid, firstname, lastname, gender, birthdate) 
			   value (1, 1, 'Zana', 'Gashi', 'F', '2021-04-03');
insert into children (adultid, classid, firstname, lastname, gender, birthdate) 
			   values (2, 1, 'Beni', 'Aliu', 'M', '2021-05-12'),
					  (2, 1, 'Edon', 'Aliu', 'M', '2021-05-12');

create table Activities(
aid int not null primary key auto_increment,
name varchar(20),
startTime time,
endTime time,
created_at timestamp default current_timestamp not null,
updated_at timestamp,
INDEX nameActivities_index (name ASC) visible
);

select * from Activities; 
insert into Activities(name,startTime,endTime) values ('Lexim', '10:0:0','10:0:0');
insert into Activities(name,startTime,endTime) values ('Sport', '12:0:0', '13:0:0');

update Activities set endTime = '10:0:0' where aid = 1;

create table Activities_Children(
activityid int not null,
childrenid int not null,
description varchar(30),	
-- primary key(activityid, childrenid),
foreign key (activityid) references Activities(aid) on delete cascade on update cascade,
foreign key (childrenid) references Children(cid) on delete cascade on update cascade
);

select * from activities_children;
insert into activities_children values (1,1,null),
									   (2,1,null),
                                       (1,2,null);
insert into activities_children (activityid, childrenid, description) value (2,3,'sportTime');
create table General(
gid int primary key auto_increment not null,
name varchar(20) not null,
location varchar(50),
description varchar(50)
);

select * from general;

insert into General (name,location) value ('Kopshti Sonila', 'Prishtine Rr.Agim Ramadani Nr.80');


select c.firstname 'Emri femiut', a.firstname 'Emri Prindit', a.lastname 'Mbiemri', cl.classNumber 'Numri Klases', ach.childrenid,
ac.name 'Emri Aktivitetit', ac.startTime
from children c
inner join adults a on c.adultid = a.aid
inner join class cl on c.classid = cl.cid
inner join activities_children ach on c.cid = ach.childrenid
inner join activities ac on ach.activityid = ac.aid;

select c.firstname 'Emri femiut', a.firstname 'Emri Prindit', a.lastname 'Mbiemri', cl.classNumber 'Numri Klases'
from children c
inner join adults a on c.adultid = a.aid
inner join class cl on c.classid = cl.cid;

-- emri femiut dhe aktiviteti i tij


select * from activities_children;

