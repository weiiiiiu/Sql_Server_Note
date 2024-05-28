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
--5.״̬��Ϣ�仯���洢���п�״̬1:����,2:��ʧ,3:����,4:ע����

select * from AccountInfo
select * from BankCard


--��ṹ���
create table AccountInfo  --�˻���Ϣ��
(
	AccountId int primary key identity(1,1), --�˻����
	AccountCode varchar(20) not null, --���֤����
	AccountPhone varchar(20) not null, --�绰����
	RealName varchar(20) not null, --��ʵ����
	OpenTime smalldatetime not null, --����ʱ��
)
create table BankCard --���п�
(
	CardNo varchar(30) primary key, --���п�����
	AccountId int not null, --�˻���ţ����˻���Ϣ���γ��������ϵ��
	CardPwd varchar(30) not null, --���п�����
	CardMoney money not null, --���п����
	CardState int not null,--1:����,2:��ʧ,3:����,4:ע��
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

create table CardStateChange --״̬��Ϣ�仯���洢���п�״̬1:����,2:��ʧ,3:����,4:ע����
(
	StateId int primary key identity(1,1),--״̬��Ϣ�Զ����
	CardNo varchar(30) not null, --���п���(�����п����γ��������ϵ)
	OldState int not null, --���п�ԭʼ״̬
	NewState int not null, --���п���״̬
	StateWhy varchar(200) not null, --״̬�仯ԭ��
	StateTime smalldatetime not null, --��¼����ʱ��
)
-------------------------------------------------------------------------------------------------------------------------












