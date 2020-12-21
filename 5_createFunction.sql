--create a function calculating the total balanace from all accounts of a single client
create function f_CalculateTotalBalance (@ClientID int)
returns decimal (15,2)
begin
	declare @result as decimal(15,2) = (
		select sum(Balance)
		from Accounts where ClientId=@ClientID
	)
	return @result
end

select dbo.f_CalculateTotalBalance(4) as Balance