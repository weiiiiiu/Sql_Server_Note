--����
--��1��ϵͳ����
--��2���Զ��庯�� --->1.����ֵ����(���ص���ֵ)��2.	

--��дһ������������еĽ���ܺ�
--create function GetSumCardMoney()
--returns money 
--as
--begin
--	declare @AllMOney money
--	select @AllMOney = (select SUM(CardMoney) from BankCard)
--	return @AllMOney
--end
--go
--select dbo.GetSumCardMoney()

--�����˻���ţ������˻���ʵ����
--��������
--create function GetNameById(@AccountId int)
--returns  varchar(20)
--as
--begin
--	declare @RealName varchar(20)
--	select @RealName = (select RealName from AccountInfo where AccountId = @AccountId)
--	return @RealName
--end
--go

--drop function GetNameById  --ɾ������

----��������
--print dbo.GetNameById(2)


--ͨ������ʵ�֣����ݿ�ʼʱ��ͽ���ʱ�䣬���ؽ��׼�¼����ǮȡǮ��
--���׼�¼�а��� ��ʵ���������ţ���Ǯ��ȡǮ������ʱ��
--����һ��
--create function GetExchangeByTime(@StartTime varchar(30),@EndTime varchar(30))
--returns @ExchangeTable table
--(
--	RealName varchar(30),  --��ʵ����
--	CardNo varchar(30),    --����
--	MoneyInBank money,     --��Ǯ���
--	MoneyOutBank money,    --ȡǮ���
--	ExchangeTime smalldatetime  --����ʱ��
--)
--as
--begin
--	insert into @ExchangeTable
--	select AccountInfo.RealName,CardExchange.CardNo,CardExchange.MoneyInBank,
--	CardExchange.MoneyOutBank,CardExchange.ExchangeTime from CardExchange
--	left join BankCard on CardExchange.CardNo = BankCard.CardNo
--	left join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
--	where CardExchange.ExchangeTime between @StartTime+' 00:00:00' and @EndTime+' 23:59:59'
--	return
--end
--go
----ɾ������
--drop function GetExchangeByTime
----��������
--select * from GetExchangeByTime('2018-6-1','2018-7-1')


--��������
--create function GetExchangeByTime(@StartTime varchar(30),@EndTime varchar(30))
--returns table
--as
--	return
--	select AccountInfo.RealName,CardExchange.CardNo,CardExchange.MoneyInBank,
--	CardExchange.MoneyOutBank,CardExchange.ExchangeTime from CardExchange
--	left join BankCard on CardExchange.CardNo = BankCard.CardNo
--	left join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
--	where CardExchange.ExchangeTime between @StartTime+' 00:00:00' and @EndTime+' 23:59:59'
--go
----ɾ������
--drop function GetExchangeByTime
----��������
--select * from GetExchangeByTime('2018-6-19','2018-6-19')



--exp:��ѯ���п���Ϣ��
--�����п�״̬1,2,3,4�ֱ�ת��Ϊ���֡�����,��ʧ,����,ע����
--�������п������ʾ���п��ȼ� 30������Ϊ����ͨ�û���,30������Ϊ"VIP�û�"
--�ֱ���ʾ���ţ����֤�����������û��ȼ������п�״̬

--����һ��ֱ����sql�����ʹ��case when
--select * from AccountInfo
--select * from BankCard
--select CardNo ����,AccountCode ���֤,RealName ����,CardMoney ���,
--case
--	when CardMoney < 300000 then '��ͨ�û�'
--	else 'VIP�û�' 
--end �û��ȼ�,
--case
--	when CardState = 1 then '����'
--	when CardState = 2 then '��ʧ'
--	when CardState = 3 then '����'
--	when CardState = 4 then 'ע��'
--	else '�쳣'
--end ��״̬
--from BankCard inner join AccountInfo on BankCard.AccountId = AccountInfo.AccountId

--�����������ȼ���״̬�ú���ʵ��
--create function GetGradeByMoney(@myMoney int)
--returns varchar(10)
--as
--begin
--	declare @result varchar(10)
--	if @myMoney < 3000 
--		set @result = '��ͨ�û�'
--	else
--		set @result = 'VIP�û�'
--	return @result
--end
--go
--
--create function GetStatusByNumber(@myNum int)
--returns varchar(10)
--as
--begin
--	declare @result varchar(10)
--	if @myNum = 1
--		set @result = '����'
--	else if @myNum = 2
--		set @result = '��ʧ'
--	else if @myNum = 3
--		set @result = '����'
--	else if @myNum = 4
--		set @result = 'ע��'
--	else
--		set @result = '�쳣'	
--	return @result
--end
--go

--select CardNo ����,AccountCode ���֤,RealName ����,CardMoney ���,
--dbo.GetGradeByMoney(CardMoney) �˻��ȼ�,dbo.GetStatusByNumber(CardState) ��״̬
--from BankCard inner join AccountInfo on BankCard.AccountId = AccountInfo.AccountId




--exp:��д���������ݳ�������������
--������ʵ��
--���磺����Ϊ2000-5-5����ǰΪ2018-5-4������Ϊ17��
--      ����Ϊ2000-5-5����ǰΪ2018-5-6������Ϊ18��
--create table Emp
--(
--	EmpId int primary key identity(1,2), --�Զ����
--	empName varchar(20), --����
--	empSex varchar(4),   --�Ա�
--	empBirth smalldatetime --����
--)
--insert into Emp(empName,empSex,empBirth) values('����','��','2008-5-8')
--insert into Emp(empName,empSex,empBirth) values('����','��','1998-10-10')
--insert into Emp(empName,empSex,empBirth) values('�ŷ�','��','1999-7-5')
--insert into Emp(empName,empSex,empBirth) values('����','��','2003-12-12')
--insert into Emp(empName,empSex,empBirth) values('��','��','2003-1-5')
--insert into Emp(empName,empSex,empBirth) values('����','��','1988-8-4')
--insert into Emp(empName,empSex,empBirth) values('κ��','��','1998-5-2')
--insert into Emp(empName,empSex,empBirth) values('��Ӻ','��','1992-2-20')
--insert into Emp(empName,empSex,empBirth) values('�����','��','1993-3-1')
--insert into Emp(empName,empSex,empBirth) values('����','��','1994-8-5')

--create function GetAgeByBirth(@birth smalldatetime)
--returns int
--as
--begin
--	declare @age int
--	set @age = year(getdate()) - year(@birth)
--	if month(getdate()) < month(@birth)
--		set @age = @age - 1
--	if month(getdate()) = month(@birth) and day(getdate()) < day(@birth)
--		set @age = @age -1
--	return @age
--end
--go
--select *,dbo.GetAgeByBirth(empBirth) ���� from Emp























