--Insert data in the tables
insert into Clients (FirstName, LastName) values 
('Greta', 'Andersson'),
('Peter', 'Petterson'),
('Mel', 'Gibson'),
('Maria', 'Danielsson')

insert into AccountType (Name) values
('Checking'),
('Savings')

insert into Accounts (ClientId, AccountTypeId, Balance) values
(1, 1, 175),
(2, 1, 275.56),
(3, 1, 138.01),
(4, 1, 40.30),
(4, 2, 375.50)