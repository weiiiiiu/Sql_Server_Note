--�洢���̣��洢���̣�Procedure����SQL�������̿�������Ԥ���뼯��
--ϵͳ���ô洢���̣���PPT���ܣ�

--û�����������û����������Ĵ洢����
--exp:����洢����ʵ�ֲ�ѯ���˻������͵����п��˻���Ϣ,��ʾ���п��ţ��������˻����
--����һ
--create proc proc_MinMoneyCard
--as
--select top 1 CardNo ���п���,RealName ����,CardMoney ���
--from BankCard inner join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
--order by CardMoney asc
--go

--���������������ͣ��ж��������ʾ����Ƕ����
--create proc proc_MinMoneyCard
--as
--select CardNo ���п���,RealName ����,CardMoney ���
--from BankCard inner join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
--where CardMoney=(select MIN(CardMoney) from BankCard)
--go

--exec proc_MinMoneyCard


--�����������û����������Ĵ洢����
--exp:ģ�����п���Ǯ�������������п��ţ���Ǯ��ʵ�ִ�Ǯ����
--create proc proc_CunQian
--@CardNo varchar(30),
--@MoneyInBank money
--as
--update BankCard set CardMoney = CardMoney + @MoneyInBank where CardNo = @CardNo
--insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
--values(@CardNo,@MoneyInBank,0,GETDATE())
--go


--select * from BankCard
--select * from AccountInfo
--select * from CardExchange

--exec proc_CunQian '6225125478544587',3000


--�����������û����������������з���ֵ�Ĵ洢����
--create proc proc_QuQian
--@CardNo varchar(30),
--@MoneyOutBank money
--as
--update BankCard set CardMoney = CardMoney - @MoneyOutBank where CardNo = @CardNo
--if @@ERROR <> 0
--	return -1
--insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
--values(@CardNo,0,@MoneyOutBank,GETDATE())
--return 1
--go

--select * from BankCard
--select * from CardExchange

--declare @returnValue int
--exec @returnValue = proc_QuQian '662018092100000002',1000000
--print @returnValue



--���������������������Ĵ洢����
--exp:��ѯ��ĳʱ��ε����д�ȡ����Ϣ�Լ�����ܽ�ȡ���ܽ��
--���뿪ʼʱ�䣬����ʱ�䣬��ʾ��ȡ�����Ϣ��ͬʱ�����ش���ܽ�ȡ���ܽ��
--create proc proc_SelectExchange
--@startTime varchar(20),  --��ʼʱ��
--@endTime varchar(20),    --����ʱ��
--@SumIn money output,     --����ܽ��
--@SumOut money output    --ȡ���ܽ��
--as
--select @SumIn = (select SUM(MoneyInBank) from CardExchange 
--				where ExchangeTime between @startTime+' 00:00:00' and @endTime+' 23:59:59')
--select @SumOut = (select SUM(MoneyOutBank) from CardExchange 
--				where ExchangeTime between @startTime+' 00:00:00' and @endTime+' 23:59:59')
--select * from CardExchange 
--where ExchangeTime between @startTime+' 00:00:00' and @endTime+' 23:59:59'
--go

--declare @SumIn money     --����ܽ��
--declare @SumOut money   --ȡ���ܽ��
--exec proc_SelectExchange '2018-1-1','2018-12-31',@SumIn output,@SumOut output
--select @SumIn
--select @SumOut


--���������������������Ϊ�������Ҳ��Ϊ���������
--���������������û��������룬����û���������ȷ���������볤��<8���Զ�������8λ����
select FLOOR(RAND()*10) --0-9֮�������
create proc procPwdUpgrade
@cardno nvarchar(20),
@pwd nvarchar(20) output
as
	if not exists(select * from BankCard where CardNo=@cardno and CardPwd=@pwd)
		set @pwd = ''
	else
	begin
		if len(@pwd) < 8
		begin
			declare @len int = 8- len(@pwd)
			declare @i int = 1
			while @i <= @len
			begin
				
				set @pwd = @pwd + cast(FLOOR(RAND()*10) as varchar(1))
				set @i = @i+1
			end
			update BankCard set CardPwd = @pwd where CardNo=@cardno
		end
	end
go
declare @pwd nvarchar(20) = '123456'
exec procPwdUpgrade '6225547854125656',@pwd output
select @pwd


