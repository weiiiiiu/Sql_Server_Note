--ɾ�����ݿ�
if exists(select * from sys.databases where name = 'DBTEST')
	drop database DBTEST

--�������ݿ�
create database DBTEST
on
(
	name = 'DBTEST',
	filename = 'D:\Data\DBTEST.mdf',
	size = 5MB,
	filegrowth = 2MB
)
log on
(
	name = 'DBTEST_log',
	filename = 'D:\Data\DBTEST_log.ldf',
	size = 5MB,
	filegrowth = 2MB
)

--�������ݿ�
create database DBTEST
go
use DBTEST
--ɾ����
drop table Department
--����
create table Department --�������ű�
(
	DepartmentId int primary key identity(1,1),
	DepartmentName nvarchar(50) not null,
	DepartmentRemark text
)

drop table [Rank]
create table [Rank]
(
	RankId int primary key identity(1,1),
	RankName nvarchar(50) not null,
	RankRemark text
)

drop table People
create table People
(
	PeopleId int primary key identity(1,1),
	DepartmentId int references Department(DepartmentId)  not null,
	RankId int references [Rank](RankId) not null,
	PeopleName nvarchar(50) not null,
	PeopleSex nvarchar(1) default('��') check(PeopleSex='��' or PeopleSex='Ů') not null,
	PeopleBirth datetime not null,
	PeopleSalary decimal(12,2) check(PeopleSalary>= 1000 and PeopleSalary <= 100000) not null,
	PeoplePhone nvarchar(20) unique not null,
	PeopleAddress nvarchar(100),
	PeopleAddTime smalldatetime default(getdate())
)

--�޸ı�ṹ
--Ա�����������
alter table People
add PeopleMail nvarchar(100)
--Ա����ɾ��������
alter table People
drop column PeopleMail
--�޸������е���������Ϊvarchar(100)
alter table People
alter column PeopleMail varchar(100)




