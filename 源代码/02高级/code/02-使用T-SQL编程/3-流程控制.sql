--���̿���
--ѡ���֧�ṹ if  else

--exp:ĳ�û����п���Ϊ��6225547854125656�������û�ִ��ȡǮ������
--ȡǮ5000Ԫ�������������ȡǮ����������ʾ"ȡǮ�ɹ�"��������ʾ�����㡱
--declare @balance money
--select @balance = (select CardMoney from BankCard where CardNo='6225547854125656')
--if @balance >= 5000
--	begin
--		update BankCard set CardMoney = CardMoney - 5000
--		insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
--		values('6225547854125656',0,5000,GETDATE())
--	end
--else
--	print '����'

--exp:��ѯ���п���Ϣ��
--�����п�״̬1,2,3,4�ֱ�ת��Ϊ���֡�����,��ʧ,����,ע����
--�������п������ʾ���п��ȼ� 30������Ϊ����ͨ�û���,30������Ϊ"VIP�û�"
--�ֱ���ʾ���ţ����֤�����������û��ȼ������п�״̬
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
--������д����
--select CardNo ����,AccountCode ���֤,RealName ����,CardMoney ���,
--case
--	when CardMoney < 300000 then '��ͨ�û�'
--	else 'VIP�û�' 
--end �û��ȼ�,
--case CardState
--	when 1 then '����'
--	when 2 then '��ʧ'
--	when 3 then '����'
--	when 4 then 'ע��'
--	else '�쳣'
--end ��״̬
--from BankCard inner join AccountInfo on BankCard.AccountId = AccountInfo.AccountId


--1-ѭ����ӡ1-10(ѭ����������break��CONTINUE,������Java��C#������һ��)

--declare @i int  = 1
--while @i <= 10
--begin
--	print @i
--	set @i = @i + 1
--end

--2-ѭ����ӡ�žų˷���
--�Ʊ��	CHAR(9)
--���з�	CHAR(10)
--�س�	CHAR(13)


declare @i int = 1
declare @str varchar(1000)
while @i<=9
begin
	declare @j int = 1
	set @str = ''
	while @j <= @i
	begin
		--����һ
		--set @str = @str + cast(@i as varchar(2)) + '*' + cast(@j as varchar(2)) + 
		--'=' + cast(@i*@j as varchar(2)) + CHAR(9)
		--������
		set @str = @str + Convert(varchar(2),@i) + '*' + Convert(varchar(2),@j) + 
		'=' + Convert(varchar(2),@i*@j) + CHAR(9)		
		set @j = @j + 1
	end
	print @str
	set @i = @i + 1
end


















