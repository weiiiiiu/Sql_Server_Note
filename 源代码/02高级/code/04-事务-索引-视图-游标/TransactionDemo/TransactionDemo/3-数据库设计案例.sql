--ҵ������˵��---------------------------------------------------------------------------------
--ģ������ҵ����Ƽ��װ���������ݿ��ṹ��Ҫ�����������»�����������
--1.���п�����ע�������Ϣ�����������������п�����һ���˿��԰���������п����������ֻ�ܰ���3�ţ�
--2.��Ǯ
--3.��ѯ���
--4.ȡǮ
--5.ת��
--6.�鿴���׼�¼
--7.�˻���ʧ
--8.�˻�ע��


--�����----------------------------------------------------------------------------------------
--1.�˻���Ϣ��
--2.���п���
--3.������Ϣ���洢��Ǯ��ȡǮ�ļ�¼��
--4.ת����Ϣ���洢ת����Ϣ��¼��
--5.״̬��Ϣ���洢���п�״̬0:����,1:��ʧ,2:����,3:ע����


--��ṹ���
create table AccountInfo  --�˻���Ϣ��
(
	AccountId int primary key identity(1,1), --�˻����
	AccountCode varchar(20) not null, --���֤����
	AccountPhone varchar(20) not null, --�绰����
	RealName varchar(20) not null, --��ʵ����
	AccountPwd  varchar(20) not null, --�˻�����
	OpenTime smalldatetime not null, --����ʱ��
)
create table BankCard --���п�
(
	CardNo varchar(30) primary key, --���п�����
	AccountId int not null, --�˻���ţ����˻���Ϣ���γ��������ϵ��
	CardPwd varchar(30) not null, --���п�����
	CardMoney money not null, --���п����
	CardState int not null,--0:����,1:��ʧ,2:����,3:ע��
	CardTime smalldatetime default(getdate()) --����ʱ��
)
create table CardExchange --������Ϣ���洢��Ǯ��ȡǮ�ļ�¼��
(
	ExchangeId int primary key identity(1,1), --�����Զ����
	CardNo varchar(30) not null, --���п���(�����п����γ��������ϵ)
	MoneyInBank money not null, --��Ǯ���
	MoneyOutBank money not null, --ȡǮ���
	ExchangeTime smalldatetime not null, --����ʱ��
)

create table CardTransfer --ת����Ϣ���洢ת����Ϣ��¼��
(
	TransferId int primary key identity(1,1),--ת���Զ����
	CardNoOut varchar(30) not null, --ת�����п���(�����п����γ��������ϵ)
	CardNoIn varchar(30) not null, --ת�����п���(�����п����γ��������ϵ)
	TransferMoney money not null,--���׽��
	TransferTime smalldatetime not null, --����ʱ��
)

create table CardState --״̬��Ϣ���洢���п�״̬0:����,1:��ʧ,2:����,3:ע����
(
	StateId int primary key identity(1,1),--״̬��Ϣ�Զ����
	CardNo varchar(30) not null, --���п���(�����п����γ��������ϵ)
	OldState int not null, --���п�ԭʼ״̬
	NewState int not null, --���п���״̬
	StateWhy varchar(200) not null, --״̬�仯ԭ��
	StateTime smalldatetime not null, --��¼����ʱ��
)
-------------------------------------------------------------------------------------------------------------------------

--Ϊ�����������ŷ������˽��п��������Ĳ���
--�������֤��420107198905064135
--�������֤��420107199507104133
--�ŷ����֤��420107199602034138
insert into AccountInfo(AccountCode,AccountPhone,RealName,AccountPwd,OpenTime)
values('420107198905064135','13554785425','����','123456',GETDATE())
insert into BankCard(CardNo,AccountId,CardPwd,CardMoney,CardState)
values('6225125478544587',1,'123456',0,0)

insert into AccountInfo(AccountCode,AccountPhone,RealName,AccountPwd,OpenTime)
values('420107199507104133','13454788854','����','123456',GETDATE())
insert into BankCard(CardNo,AccountId,CardPwd,CardMoney,CardState)
values('6225547858741263',2,'123456',0,0)

insert into AccountInfo(AccountCode,AccountPhone,RealName,AccountPwd,OpenTime)
values('420107199602034138','13456896321','�ŷ�','123456',GETDATE())
insert into BankCard(CardNo,AccountId,CardPwd,CardMoney,CardState)
values('6225547854125656',3,'123456',0,0)

select * from AccountInfo
select * from BankCard

--���д�Ǯ������������Ǯ2000Ԫ�������Ǯ��8000Ԫ���ŷɴ�Ǯ��500000Ԫ
select * from AccountInfo
update BankCard set CardMoney = CardMoney + 2000 where CardNo = '6225125478544587'
insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
values('6225125478544587',2000,0,GETDATE())

update BankCard set CardMoney = CardMoney + 8000 where CardNo = '6225547858741263'
insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
values('6225547858741263',8000,0,GETDATE())

update BankCard set CardMoney = CardMoney + 500000 where CardNo = '6225547854125656'
insert into CardExchange(CardNo,MoneyInBank,MoneyOutBank,ExchangeTime)
values('6225547854125656',500000,0,GETDATE())

--ת�ˣ��������ŷ�ת��1000Ԫ
update BankCard set CardMoney = CardMoney -1000 where CardNo = '6225125478544587'
update BankCard set CardMoney = CardMoney + 1000 where CardNo = '6225547854125656'
insert into CardTransfer(CardNoOut,CardNoIn,TransferMoney,TransferTime)
values('6225125478544587','6225547854125656',1000,GETDATE())










