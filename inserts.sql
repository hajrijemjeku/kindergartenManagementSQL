insert into Adults (firstname, lastname, gender, email, phoneNumber, username, password) 
				value('Arta', 'Gashi', 'F', 'artagashi@gmail.com', '049123456', 'artagashi', '123456');
insert into Adults (firstname, lastname, gender, email, phoneNumber, username, password) 
				values('Andi', 'Aliu', 'M', 'andialiu@gmail.com', '044222333', 'andialiu', 'test123'),
					  ('Mali', 'Uka', 'M', 'maliuka@hotmail.com', '044111456', 'maliuka', '54321');



select * from Roles;
insert into Roles (name) values ('manager'),
							    ('parent');


select * from Adults_Roles;
insert into Adults_Roles (adultid, roleid, description) 
				  values (3, 1, 'Menaxheri CRUD operations'),
					     (2,2, 'Prindi lexon te dhenat e femiut'),
                         (1,2, 'Prindi lexon te dhenat e femiut');


select * from Permissions;
insert into Permissions (name) values ('CRUD'),
									  ('Read');	


select * from Permissions_Roles;
insert into Permissions_Roles values (1,1),
									 (2,2);


select * from Address;
insert into Address (adultid, country, city, street, zipcode) 
				values (1, 'Kosova','Prishtina','Agim Ramadani', '10000'),
					   (2, 'Kosova', 'Prishtina','Rexhep Mala', '10000'),
                       (3, 'Kosova','Prishtina','Ukshin Hoti', '10000');


select * from Class;
insert into Class (classNumber, actualNumber, maxNumber) values ('1b', 3, 10);
insert into Class (classNumber, actualNumber, maxNumber) values ('2a', 2, 10);


select * from children;
insert into children (adultid, classid, firstname, lastname, gender, birthdate) 
			   value (1, 1, 'Zana', 'Gashi', 'F', '2021-04-03');
insert into children (adultid, classid, firstname, lastname, gender, birthdate) 
			   values (2, 1, 'Beni', 'Aliu', 'M', '2021-05-12'),
					  (2, 1, 'Edon', 'Aliu', 'M', '2021-05-12');


select * from Activities; 
insert into Activities(name,startTime,endTime) values ('Lexim', '10:0:0','10:0:0');
insert into Activities(name,startTime,endTime) values ('Sport', '12:0:0', '13:0:0');


select * from activities_children;
insert into activities_children values (1,1,null),
									   (2,1,null),
                                       (1,2,null);
insert into activities_children (activityid, childrenid, description) value (2,3,'sportTime');



select * from general;
insert into General (name,location) value ('Kopshti Sonila', 'Prishtine Rr.Agim Ramadani Nr.80');