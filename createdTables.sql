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

create table Roles(
rid int not null primary key auto_increment,
name char(10)
);

create table Adults_Roles(
adultid int not null,
roleid int not null,
description varchar(50),
-- primary key(adultid, roleid), 
foreign key (adultid) references Adults(aid) on delete cascade on update cascade,
foreign key (roleid) references Roles(rid) on delete cascade on update cascade
);

create table Permissions(
pid int not null primary key auto_increment,
name varchar(30)
);

create table Permissions_Roles(
permissionid int not null,
roleid int not null,
-- primary key(permissionid, roleid),
foreign key (permissionid) references Permissions(pid) on delete cascade on update cascade,
foreign key (roleid) references Roles(rid) on delete cascade on update cascade
);

create table Address(
aid int not null primary key auto_increment,
adultid int not null,
country varchar(20),
city varchar(20),
street varchar(40),
zipcode varchar(10),
foreign key (adultid) references Adults(aid)
);

create table Class(
cid int not null auto_increment primary key,
classNumber varchar(10),
maxNumber int,
created_at timestamp default current_timestamp not null,
updated_at timestamp
);

create table Children(
cid int primary key auto_increment not null,
adultid int not null,
classid int null,
firstname varchar(20),
lastname varchar(20),
gender enum('M','F'),
image varchar(200),
birthdate date,
created_at timestamp default current_timestamp not null,
updated_at timestamp,
foreign key (adultid) references Adults(aid) on delete cascade on update cascade,
foreign key (classid) references Class(cid) on delete set null on update cascade,
INDEX fnameChildren_index (firstname ASC) visible
);

create table Activities(
aid int not null primary key auto_increment,
name varchar(20),
startTime time,
endTime time,
created_at timestamp default current_timestamp not null,
updated_at timestamp,
INDEX nameActivities_index (name ASC) visible
);

create table Activities_Children(
activityid int not null,
childrenid int not null,
description varchar(30),	
-- primary key(activityid, childrenid),
foreign key (activityid) references Activities(aid) on delete cascade on update cascade,
foreign key (childrenid) references Children(cid) on delete cascade on update cascade
);

create table General(
gid int primary key auto_increment not null,
name varchar(20) not null,
location varchar(50),
description varchar(50)
);

