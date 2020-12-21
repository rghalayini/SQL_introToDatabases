--create tables in the Bank database
use Bank

create table Clients
(
	Id int Primary Key identity(1,1),
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
)

create table AccountType
(
	Id int Primary Key identity(1,1),
	[Name] nvarchar(50) NOT NULL,
)

create table Accounts
(
	Id int Primary Key identity(1,1),
	AccountTypeId int foreign key references AccountType(Id),
	Balance decimal(15,2) NOT NULL default(0),
	ClientId int  foreign key references Clients(Id)
)

select * from Clients
select * from AccountType
select * from Accounts