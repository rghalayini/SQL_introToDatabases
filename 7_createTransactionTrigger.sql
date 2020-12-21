--create transaction table
create table Transactions
(
	Id int primary key identity(1,1),
	AccountId int foreign key references Accounts(Id),
	OldBalance decimal (15,2) NOT NULL,
	NewBalance decimal (15,2) NOT NULL,
	Amount as NewBalance - OldBalance,
	[DateTime] datetime2
)

--create a trigger which will run whenever the accounts table is updated by the procedures
create trigger tr_Transaction on Accounts
after update
as 
	insert into Transactions (AccountId, OldBalance, NewBalance, [DateTime])
	select inserted.Id, deleted.Balance, inserted.Balance, getdate() from inserted
	join deleted on inserted.Id	= deleted.Id 


p_Deposit 1, 25.00
GO

p_Deposit 1, 40.00
GO

p_Withdraw 2, 200.00
GO

p_Deposit 4, 180.00
GO

select * from Transactions