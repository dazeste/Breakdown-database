CREATE DATABASE breakdown_company;
USE breakdown_company;

CREATE TABLE Member (
MemberID int not null , 
MFName varchar(20) not null,
MLName varchar(20) not null,
MLoc varchar(20) not null,
PRIMARY KEY(MemberID));

CREATE TABLE Vehicle (
VehReg varchar(20) not null,
MemberID int not null , 
VehMake varchar(10) not null,
VehModel varchar(10) not null,
PRIMARY KEY(VehReg),
 FOREIGN KEY(MemberID)
REFERENCES Member(MemberID)
);

CREATE TABLE Engineer(
EngID int not null,
EFName varchar(20) not null,
ELName varchar(20) not null,
VMileage int not null,
PRIMARY KEY(EngID));

CREATE TABLE EngVan(  
VanReg varchar(10) not null,
VanMake varchar(10) not null,
VanModel varchar(10) not null,
EngID int not null,
PRIMARY KEY(VanReg),
FOREIGN KEY(EngID)
REFERENCES Engineer(EngID) 
);


CREATE TABLE Breakdown(
BDID int not null,
BDDATE Date DEFAULT null,
BDTIME Time DEFAULT null,
BDLoc varchar(20) not null,
VanReg varchar(10) not null,
VehReg varchar(20) not null,
PRIMARY KEY(BDID),
FOREIGN KEY(VehReg)
REFERENCES Vehicle(VehReg), 
FOREIGN KEY(VanReg)
REFERENCES EngVan(VanReg)
);


-----------------------------------------
INSERT INTO  Member (MemberID, MFName, MLName, MLoc)
VALUES
('001','Tom', 'Jonas','Bristol'),
('002','Dan', 'Doe','London'),
('003','John', 'Smith','Oxford'),
('004','Emily', 'Jonas','Birmingham'),
('005','Thomas', 'Ford','Manchester');


INSERT INTO Vehicle (VehReg, MemberID, VehMake, VehModel)
VALUES
('AC16PAY', '001', '2009', 'Nissan'),
('VC78PGH', '001', '2001', 'Mini'),
('AH09POP', '002', '2019', 'Ferrari'),
('LC06KLJ', '003', '2020', 'VW Golf'),
('VT78UYH', '004', '2001', 'FORD'),
('AH09PFD', '004', '2010', 'Ferrari'),
('LC06KGH', '003', '2022', 'VW Golf'),
('KC03PJK', '005', '2021', 'Porsche');

INSERT INTO Engineer (EngID, EFName,ELName,VMileage)
VALUES
('001','Jim','Brown','79000'),
('002','Sam','Lord','70000'),
('003','Tomas','Bond','30000');

INSERT INTO EngVan(VanReg, VanMake,VanModel,EngID) 
VALUES
('23456','2009', 'chevy','001'),
('23896','2013', 'ford','002'),
('26786','2019', 'nissan','003'),
('23856','1999', 'toyota','004'),
('23776','2011', 'sprinter','005');

INSERT INTO Breakdown(BDID, BDDATE, BDTIME, BDLoc, VanReg, VehReg) 
VALUES
('001','2009-12-23','19:30:10','London','23456','AC16PAY'),
('002','2009-12-23','20:30:10','Birmingham','23896','VC78PGH'),
('003','2009-12-23','19:30:10','London','26786','AH09POP'),
('004','2009-11-23','19:30:10','London','26786','AH09POP'),
('005','2009-11-23','19:30:10','Bristol','26786','AH09POP'),
('006','2019-11-23','19:30:10','London','26786','VC78PGH'),
('007','2009-09-23','19:30:10','Stansted','26786','VC78PGH'),
('008','2009-08-22','19:30:10','London','23856','LC06KLJ'),
('009','2009-07-23','19:30:10','Luton','23776','VT78UYH'),
('010','2009-07-20','19:30:10','London','23776','AH09PFD'),
('011','2010-08-21','19:30:10','Aberdeen','23896','KC03PJK'),
('012','2022-10-19','19:30:10','Liverpool','23896','KC03PJK');
-----------------------------------------
-- TASK 3
-----------------------------------------

-- 1.	The names of members who live in a location e.g. London. 
use breakdown_company;
Select MFName,MLName
From member
where MLoc ='London';


-----------------------------------------
-- TASK 4
-----------------------------------------

-- CREATE DATABASE Membership;
-- USE Membership;

CREATE TABLE MshipType(
MTID int not null , 
MType varchar(10) not null,
MPrice decimal(4,2) not null,
PRIMARY KEY(MTID));

INSERT INTO MshipType (MTID, MType, MPrice) 
VALUES
('001','Gold',99.99),
('002','Silver',59.99),
('003','Bronze',39.99);


--------------