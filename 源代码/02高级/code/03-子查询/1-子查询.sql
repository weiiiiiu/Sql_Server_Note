select * from AccountInfo
select * from BankCard
--exp1:��������п���Ϊ"6225547858741263"����ѯ�����ȹ��������п���Ϣ��
--��ʾ���ţ����֤�����������
--����һ��
declare @gyBalance money
select @gyBalance = (select CardMoney from BankCard where CardNo='6225547858741263')
select CardNo ����,AccountCode ���֤,RealName ����,CardMoney ��� from BankCard 
left join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
where CardMoney > @gyBalance
--������:
select CardNo ����,AccountCode ���֤,RealName ����,CardMoney ��� from BankCard 
left join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
where CardMoney > 
(select CardMoney from BankCard where CardNo='6225547858741263')

----------------------------------------------------------------------------------------------------
--exp2:�������˻���Ϣ�в�ѯ�������ߵĽ�����ϸ(��ǮȡǮ��Ϣ)
--����һ��
select * from CardExchange where CardNo in 
(select CardNo from BankCard where CardMoney = 
  (select MAX(CardMoney) from BankCard)
)
--��������������ж�����п������Ȳ�����ߣ��˷���ֻ���������һ���˵���ϸ��
select * from CardExchange where CardNo = 
(select top 1 CardNo from BankCard order by CardMoney desc)
---------------------------------------------------------------------------------------------------

--exp3:��ѯ��ȡ���¼�����п����˻���Ϣ����ʾ���ţ����֤�����������
select CardNo ����,AccountCode ���֤,RealName ����,CardMoney ��� from BankCard 
left join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
where CardNo in
(select CardNo from CardExchange where MoneyOutBank <> 0)

--exp4:��ѯ��û�д���¼�����п����˻���Ϣ����ʾ���ţ����֤�����������
select CardNo ����,AccountCode ���֤,RealName ����,CardMoney ��� from BankCard 
left join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
where CardNo not in
(select CardNo from CardExchange where MoneyInBank <> 0)
-----------------------------------------------------------------------------------------------------


--exp5:��������п���Ϊ"6225547858741263",��ѯ�����Ƿ����յ�ת��
if exists(select * from CardTransfer where CardNoIn = '6225547858741263'
and convert(varchar(10),TransferTime, 120) = convert(varchar(10),getdate(), 120)
)
	print '��ת�˼�¼'
else
	print 'û��ת�˼�¼'
--��ע����������Ҳ����ʹ��not exists��ʵ�֣���ʾ�������ڼ�¼
--------------------------------------------------------------------------------------------------------


--exp6:��ѯ�����״��������ȡ��������������п��˻���Ϣ��
--��ʾ�����ţ����֤�������������״���
--����һ
select top 1 BankCard.CardNo ����,AccountCode ���֤,RealName ����,CardMoney ���,
exchangeCount ���״��� from BankCard 
inner join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
inner join
(select CardNo,COUNT(*) exchangeCount from CardExchange group by CardNo) CarcExchageTemp
on BankCard.CardNo = CarcExchageTemp.CardNo
order by exchangeCount desc


--������(����ж���˽��״�����ͬ�����ǽ��״�����࣬��ʹ�����·���)
--select  BankCard.CardNo ����,AccountCode ���֤,RealName ����,CardMoney ���,���״��� 
--from AccountInfo
--inner join BankCard on AccountInfo.AccountId = BankCard.AccountId
--inner join
--(select CardNo,COUNT(*) ���״��� from CardExchange group by CardNo) Temp 
--on BankCard.CardNo = Temp.CardNo
--where ���״��� = (select max(���״���) from
--(select CardNo,COUNT(*) ���״��� from CardExchange group by CardNo) Temp )


--exp7:��ѯ��û��ת�˽��׼�¼�����п��˻���Ϣ
--��ʾ���ţ����֤�����������
--select CardNo ����,AccountCode ���֤,RealName ����,CardMoney ��� from BankCard 
--left join AccountInfo on BankCard.AccountId = AccountInfo.AccountId
--where BankCard.CardNo not in (select CardNoIn from CardTransfer)
--and BankCard.CardNo not in (select CardNoOut from CardTransfer)



--exp8:��ҳ
create table Student
(
	StuId int primary key identity(1,2), --�Զ����
	StuName varchar(20),
	StuSex varchar(4)
)
insert into Student(StuName,StuSex) values('����','��')
insert into Student(StuName,StuSex) values('����','��')
insert into Student(StuName,StuSex) values('�ŷ�','��')
insert into Student(StuName,StuSex) values('����','��')
insert into Student(StuName,StuSex) values('��','��')
insert into Student(StuName,StuSex) values('����','��')
insert into Student(StuName,StuSex) values('κ��','��')
insert into Student(StuName,StuSex) values('��Ӻ','��')
insert into Student(StuName,StuSex) values('�����','��')
insert into Student(StuName,StuSex) values('����','��')
insert into Student(StuName,StuSex) values('�ܲ�','��')
insert into Student(StuName,StuSex) values('��ƽ','��')
insert into Student(StuName,StuSex) values('�Ű�','��')
insert into Student(StuName,StuSex) values('�ܲ�','��')
insert into Student(StuName,StuSex) values('����','��')
insert into Student(StuName,StuSex) values('��ا','��')
insert into Student(StuName,StuSex) values('��ֲ','��')
insert into Student(StuName,StuSex) values('����','��')
insert into Student(StuName,StuSex) values('��Τ','��')
insert into Student(StuName,StuSex) values('����','��')
insert into Student(StuName,StuSex) values('�ĺ��','��')
insert into Student(StuName,StuSex) values('����','��')
insert into Student(StuName,StuSex) values('����','��')
insert into Student(StuName,StuSex) values('��ڼ','��')
insert into Student(StuName,StuSex) values('��Ȩ','��')
insert into Student(StuName,StuSex) values('���','��')
insert into Student(StuName,StuSex) values('���','��')
insert into Student(StuName,StuSex) values('̫ʷ��','��')
insert into Student(StuName,StuSex) values('����','Ů')
insert into Student(StuName,StuSex) values('С��','Ů')

--����һ��ʹ��row_number��ҳ
declare @PageSize int = 5
declare @PageIndex int = 1
select * from (select ROW_NUMBER() over(order by StuId) RowId,Student.* from Student) TempStu
where RowId between (@PageIndex-1)*@PageSize+1 and @PageIndex*@PageSize

--��������ʹ��top��ҳ
declare @PageSize int = 5
declare @PageIndex int = 1
select top(@PageSize) * from Student
where StuId not in (select top((@PageIndex-1)*@PageSize) StuId from Student)

