--create a procedure that creates a new account for an existing client
create proc p_AddAccount @ClientId int,  @AccountTypeId int as
insert into Accounts (ClientId, AccountTypeId)
values (@ClientId, @AccountTypeId)


p_AddAccount 2,2


--create a deposit procedure that will add our input amount and withdraw money from accounts
create proc p_deposit @AccountId int, @Amount decimal(15,2) as
update Accounts
set Balance += @Amount
where id = @AccountId

p_deposit 1,5.5

--create a withdraw procedure that substracts the given amount of money if the balance is enough and return an error if not
create proc p_Withdraw @AccountId int, @Amount decimal (15,2) as
begin
	declare @OldBalance decimal (15,2)
	select @OldBalance = Balance from Accounts where Id=@AccountId
	if (@OldBalance - @Amount >=0)
		begin 
			update Accounts
			set Balance -= @Amount
			where id = @AccountId
		end
	else
		begin
			RAISERROR ('Insufficient funds', 10, 1)
		end
	end

p_Withdraw 1,5.1

select * from Accounts
