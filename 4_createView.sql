--Create a simple function displaying the owner, type and balance of each account
create view v_ClientBalances as 
select (FirstName + ' ' +LastName) as [Name],
	(AccountType.Name) as [Account Type], Balance
from clients
join Accounts on Clients.Id = Accounts.ClientId
join AccountType on AccountType.id = AccountTypeId

select * from v_ClientBalances