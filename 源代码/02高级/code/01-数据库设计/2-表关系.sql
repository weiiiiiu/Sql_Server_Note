--�����Ĺ�ϵ
--1.һ�Զ��ϵ��רҵ--ѧ����
--create table Profession  --רҵ
--(
--	ProId int primary key identity(1,1), --רҵ���
--	ProName varchar(50) not null --רҵ����
--)
--create table Student --ѧ��
--(
--	StuId int primary key identity(1,1), --ѧ�����
--	ProId int references Profession(ProId),
--	StuName varchar(50) not null, --ѧ������
--	StuSex char(2) not null --ѧ���Ա�
--)
--insert into Profession(ProName) values('�������')
--insert into Profession(ProName) values('��ҵ��Ϣ��')
--insert into Student(ProId,StuName,StuSex) values(1,'����','��')
--insert into Student(ProId,StuName,StuSex) values(1,'����','��')
--insert into Student(ProId,StuName,StuSex) values(2,'�ŷ�','��')
--insert into Student(ProId,StuName,StuSex) values(2,'����','��')
--select * from Student left join Profession on Student.ProId = Profession.ProId
----------------------------------------------------------------------------------------------------------------------------


--2.һ��һ��ϵ��ѧ��������Ϣ--ѧ�����飩
--����һ��
--create table StudentBasicInfo  --ѧ��������Ϣ
--(
--	StuNo varchar(20) primary key not null,  --ѧ��
--	StuName varchar(20) not null, --����
--	StuSex nvarchar(1) not null  --�Ա�
--)
--create table StudentDetailInfo  --ѧ����ϸ��Ϣ
--(
--	StuNo varchar(20) primary key not null,
--	StuQQ varchar(20), --QQ
--	stuPhone varchar(20), --�绰
--	StuMail varchar(100), --����
--	StuBirth date         --����
--)
--�������ݵ�ʱ����˳���Ȳ��������Ļ�����Ϣ���ڲ������Ļ�����Ϣ
--insert into StudentBasicInfo(StuNo,StuName,StuSex) values('QH001','����','��')
--insert into StudentBasicInfo(StuNo,StuName,StuSex) values('QH002','����','��')
--�������ݵ�ʱ����˳���Ȳ���������ϸ��Ϣ���ڲ�����������ϸ��Ϣ
--insert into StudentDetailInfo(StuNo,StuQQ,stuPhone,StuMail,StuBirth)
--values('QH002','156545214','13654525478','guanyu@163.com','1996-6-6')
--insert into StudentDetailInfo(StuNo,StuQQ,stuPhone,StuMail,StuBirth)
--values('QH001','186587854','15326545214','liubei@163.com','1998-8-8')

--�������½ṹҲ�У�
--create table StudentBasicInfo  --ѧ��������Ϣ
--(
--	StuNo int primary key identity(1,1),  --ѧ��
--	StuName varchar(20) not null, --����
--	StuSex nvarchar(1) not null  --�Ա�
--)
--create table StudentDetailInfo  --ѧ����ϸ��Ϣ
--(
--	StuNo int primary key,  --ѧ��
--	StuQQ varchar(20), --QQ
--	stuPhone varchar(20), --�绰
--	StuMail varchar(100), --����
--	StuBirth date         --����
--)
--ע�⣬��ѧ��������е����������Զ��������Զ����������򷽰�һ��˳���������


--��������
--create table StudentBasicInfo  --ѧ��������Ϣ
--(
--	StuNo int primary key identity(1,1),  --ѧ��
--	StuName varchar(20) not null, --����
--	StuSex nvarchar(1) not null  --�Ա�
--)
--create table StudentDetailInfo  --ѧ����ϸ��Ϣ
--(
--	StuDetailNo int primary key identity(1,1),  --��ϸ��Ϣ���
--	StuNo int references StudentBasicInfo(StuNo) --ѧ��,���
--	StuQQ varchar(20), --QQ
--	stuPhone varchar(20), --�绰
--	StuMail varchar(100), --����
--	StuBirth date         --����
--)
--����ʹ��һ�Զ��ģʽ����ʾһ��һ����֤��ı���ֻ��һ����Ӧ���ݼ���
--select * from StudentBasicInfo left join StudentDetailInfo 
--on StudentBasicInfo.StuNo = StudentDetailInfo.StuNo
------------------------------------------------------------------------------------------------------------------


--3.��Զ��ϵ��ѡ�γɼ�--ѧ����
--create table Course --�γ�
--(
--	CourseId int primary key identity(1,1),--�γ̱��
--	CourseName varchar(30) not null, --�γ�����
--	CourseContent text --�γ̽���
--)
--insert into Course(CourseName,CourseContent) values('HTML','��̬��ҳ������')
--insert into Course(CourseName,CourseContent) values('WinForm','WindowsӦ�ó��򿪷�')

--create table Student --ѧ��
--(
--	StuId int primary key identity(1,1), --ѧ�����
--	StuName varchar(50) not null, --ѧ������
--	StuSex char(2) not null --ѧ���Ա�
--)
--insert into Student(StuName,StuSex) values('����','��')
--insert into Student(StuName,StuSex) values('����','��')

--create Table Exam --������Ϣ��
--(
--	ExamId int primary key identity(1,1), --ѡ�γɼ����
--	StuId int not null, --ѧ�����
--	CourseId int not null,  --�γ̱��
--	Score int not null, --���Է���
--)
--insert into Exam(StuId,CourseId,Score) values(1,1,90)
--insert into Exam(StuId,CourseId,Score) values(1,2,80)
--insert into Exam(StuId,CourseId,Score) values(2,2,85)

--select * from Exam
--select * from Student inner join Exam on Student.StuId = Exam.StuId
--inner join Course on Course.CourseId = Exam.CourseId
--------------------------------------------------------------------------------------------------------------------



