--select * from BankCard
--select * from AccountInfo
--����  420107198905064135  6225125478544587
--����  420107199507104133  6225547858741263
--�ŷ�  420107199602034138  6225547854125656

--��������ȡ��6000��(���checkԼ���������˻�������>=0)
--Ҫ��ʹ������ʵ�֣��޸��������ȡ���¼��������ʹ������
begin transaction
declare @MyError int = 0
update BankCard set CardMoney = CardMoney-6000 where CardNo = '6225125478544587'
set @MyError = @MyError + @@ERROR
insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
values('6225125478544587',0,6000,GETDATE())
set @MyError = @MyError + @@ERROR
if @MyError = 0
begin
	commit transaction
	print 'ȡ��ɹ�'
end	
else
begin
	rollback transaction
	print '����'
end


--�����������ŷ�ת��1000Ԫ��(���checkԼ���������˻�������>=0)
--����������������1���ŷ����1000Ԫ����2�������۳�1000Ԫ����3������ת�˼�¼
--����ڣ�1��������ִ�гɹ����ڣ�2��������ִ��ʧ�ܣ�������������ʧ��
--ʹ��������������
begin transaction
declare @Error int = 0
update BankCard set CardMoney = CardMoney -1000 where CardNo = '6225125478544587'
set @Error = @@ERROR + @Error
update BankCard set CardMoney = CardMoney + 1000 where CardNo = '6225547854125656'
set @Error = @@ERROR + @Error
insert into CardTransfer(CardNoOut,CardNoIn,TransferMoney,TransferTime)
values('6225125478544587','6225547854125656',1000,GETDATE())
set @Error = @@ERROR + @Error
if @Error = 0
	begin
		commit
		print 'ת�˳ɹ�'
	end
else
	begin
		rollback
		print 'ת��ʧ��'		
	end
---------------------------------------------------------------------------------------------
