select * from AccountInfo
select * from BankCard

--�����¼ATM(����:662018092100000002,����:123456)
select * from BankCard where CardNo = '662018092100000002' and CardPwd = '123456'

--��ѯ���
select CardMoney,Convert(varchar(20),CardMoney,1) from BankCard 
where CardNo = '662018092100000002'

select Convert(varchar(20),CardMoney,1) from BankCard 
where CardNo = '662018092100000002'

--��Ǯ
create proc proc_InMoney
@CardNo varchar(20),
@CardMoney money
as
	begin transaction
	declare @myErr int = 0
	update BankCard set CardMoney = CardMoney + @CardMoney 
	where CardNo = @CardNo
	set @myErr = @myErr + @@ERROR
	insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
	values(@CardNo,@CardMoney,0,GETDATE())
	set @myErr = @myErr + @@ERROR
	if @myErr = 0
		commit transaction
	else
		rollback transaction
go



select * from AccountInfo
select * from BankCard
select * from CardExchange
exec proc_InMoney '662018092100000001',6000
exec proc_InMoney '662018092100000002',8000
exec proc_InMoney '662018092100000003',9000

--ȡǮ
create proc proc_OutMoney
@CardNo varchar(20),
@CardMoney money
as
	begin transaction
	declare @myErr int = 0
	update BankCard set CardMoney = CardMoney - @CardMoney 
	where CardNo = @CardNo
	set @myErr = @myErr + @@ERROR
	insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
	values(@CardNo,0,@CardMoney,GETDATE())
	set @myErr = @myErr + @@ERROR
	if @myErr = 0
		commit transaction
	else
		rollback transaction
go


select * from AccountInfo
select * from BankCard
select * from CardExchange
exec proc_OutMoney '662018092100000001',1000
exec proc_OutMoney '662018092100000002',1000
exec proc_OutMoney '662018092100000003',1000


--ת��
create proc proc_Transfer
@CardOut varchar(20), --ת������
@CardIn varchar(20),--ת�뿨��
@CardMoney money--ת�˽��
as
	begin transaction
	declare @myErr int = 0
	update BankCard set CardMoney = CardMoney - @CardMoney 
	where CardNo = @CardOut
	set @myErr = @myErr + @@ERROR
	update BankCard set CardMoney = CardMoney + @CardMoney 
	where CardNo = @CardIn
	set @myErr = @myErr + @@ERROR	
	insert into CardTransfer(CardNoOut,CardNoIn,TransferMoney,TransferTime)
	values(@CardOut,@CardIn,@CardMoney,GETDATE())
	set @myErr = @myErr + @@ERROR
	if @myErr = 0
		commit transaction
	else
		rollback transaction	
go
--ģ���ŷ�ת������2000������ת�˹���3000������תת�ŷ�1000
select * from AccountInfo
select * from BankCard
select * from CardTransfer
exec proc_Transfer '662018092100000003','662018092100000001',2000
exec proc_Transfer '662018092100000001','662018092100000002',3000
exec proc_Transfer '662018092100000002','662018092100000003',1000


--�ŷɲ�ѯ��ȡǮ���׼�¼������,����,��Ǯ��ȡǮ������ʱ�䣩
select RealName,BankCard.CardNo,MoneyInBank,MoneyOutBank,ExchangeTime
from CardExchange
inner join BankCard on CardExchange.CardNo = BankCard.CardNo
inner join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
where
ExchangeTime between cast(year(getdate()) as varchar(4)) + '-1-1'
and cast((year(getdate())+1) as varchar(4)) + '-1-1'
and BankCard.CardNo = '662018092100000003'



--�ŷɲ�ѯת�˽��׼�¼(ת����,ת������,ת���ˣ�ת�뿨��,ת�˽��,����ʱ��)
--�ŷ������תǮ��Ҫ��ѯ���������ұ������ŷ�תǮ�ļ�¼����Ҫ��ѯ����
select CardOut.RealName ת����,CardNoOut ת������,
CardIn.RealName ת����,CardNoIn ת�뿨��,TransferMoney ת�˽��,TransferTime ����ʱ��
 from CardTransfer
inner join
(select CardNo,RealName from BankCard inner join AccountInfo 
on AccountInfo.AccountId = BankCard.AccountId) CardOut
on CardTransfer.CardNoOut = CardOut.CardNo
inner join
(select CardNo,RealName from BankCard inner join AccountInfo 
on AccountInfo.AccountId = BankCard.AccountId) CardIn
on CardTransfer.CardNoIn = CardIn.CardNo
where CardNoOut = '662018092100000003' or CardNoIn = '662018092100000003'

























select * from CardTransfer
select CardNo,RealName from BankCard inner join AccountInfo 
on AccountInfo.AccountId = BankCard.AccountId
select CardNo,RealName from BankCard inner join AccountInfo 
on AccountInfo.AccountId = BankCard.AccountId
--�ŷɲ�ѯת�˽��׼�¼(ת����,ת������,ת���ˣ�ת�뿨��,ת�˽��,����ʱ��)
--�ŷ������תǮ��Ҫ��ѯ���������ұ������ŷ�תǮ�ļ�¼����Ҫ��ѯ����
select CardOut.RealName ת����,CardTransfer.CardNoOut ת������,
CardIn.RealName ת����,CardTransfer.CardNoIn ת�뿨��,
TransferMoney ת�˽��,TransferTime ����ʱ��
 from CardTransfer
inner join
(select CardNo,RealName from BankCard inner join AccountInfo 
on AccountInfo.AccountId = BankCard.AccountId) CardOut
on CardTransfer.CardNoOut = CardOut.CardNo
inner join
(select CardNo,RealName from BankCard inner join AccountInfo 
on AccountInfo.AccountId = BankCard.AccountId) CardIn
on CardTransfer.CardNoIn = CardIn.CardNo
where CardNoOut = '662018092100000003' or CardNoIn = '662018092100000003'

















