--���ݿ�����е�����ʽ
--��һ��ʽ��ȷ��ÿһ�е�ԭ���ԡ����ÿ�ж��ǲ����ٷֵ���С��λ���������һ��ʽ�� 
--exp:
--create table Student --ѧ����
--(
--	StuId varchar(20) primary key,--ѧ��
--	StuName varchar(20) not null,--ѧ������
--	StuContact varchar(50) not null, --��ϵ��ʽ
--)
--insert into Student(StuId,StuName,StuAddress) 
--values('001','����','QQ:185699887;Tel:13885874587')
--select * from Student

--��������������һ��ʽ����ϵ��ʽ��һ�в����ǲ����ٷֵ���С��Ԫ,Ӧ�޸�Ϊ���½ṹ
--create table Student --ѧ����
--(
--	StuId varchar(20) primary key,--ѧ��
--	StuName varchar(20) not null,--ѧ������
--  Tel varchar(20) not null, --��ϵ�绰
--  QQ varchar(20) not null,  --��ϵQQ
--)
----------------------------------------------------------------------------------------------------------------------------





--�ڶ���ʽ���ǶԼ�¼��Ωһ�ԣ�Ҫ���¼��Ωһ��ʶ����ʵ���Ωһ�ԣ��������ڲ�������
--exp:
--ѡ�γɼ���
--create table StudentCourse
--(
--	StuId varchar(20),--ѧ��
--	StuName varchar(20) not null,--ѧ������
--	CourseId varchar(20) not null,--�γ̱��
--	CourseName varchar(20) not null, --ѡ�ογ�����
--	CourseScore int not null, --���Գɼ�
--)
--insert into StudentCourse(StuId,StuName,CourseId,CourseName,CourseScore)
--values('001','����','001','����',80)
--insert into StudentCourse(StuId,StuName,CourseId,CourseName,CourseScore)
--values('001','����','002','��ѧ',70)
--insert into StudentCourse(StuId,StuName,CourseId,CourseName,CourseScore)
--values('002','����','003','Ӣ��',80)
--insert into StudentCourse(StuId,StuName,CourseId,CourseName,CourseScore)
--values('003','�ŷ�','003','Ӣ��',90)
--������������������һ��ѧ����Ϣ��һ���γ���Ϣ������Ȼ���������ﶼû�б�֤ʵ���Ψһ�ԣ�
--�������������ѧ�ţ��γ����������γ̱�ţ����Բ����϶���ʽ��
--�Ż��������£�
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

--select * from Student inner join Exam on Student.StuId = Exam.StuId
--inner join Course on Course.CourseId = Exam.CourseId




-------------------------------------------------------------------------------------------------------------------
--������ʽ��ÿ�ж���������أ������������࣬
--Ҫ���κ��ֶβ����������ֶ�������������Ҫ���ֶ�û�����࣬�������ڴ�������
--exp:
--create table Student
--(
--	StuId varchar(20) primary key,--ѧ��
--	StuName varchar(20) not null,--ѧ������
--	ProfessionalId int not null,--רҵ���
--	ProfessionalName varchar(50),--רҵ����
--	ProfessionalRemark varchar(200), --רҵ����
--)
--insert into Student(StuId,StuName,ProfessionalId,ProfessionalName,ProfessionalRemark)
--values('001','����',1,'�����','��ţ��רҵ')
--insert into Student(StuId,StuName,ProfessionalId,ProfessionalName,ProfessionalRemark)
--values('002','����',2,'���̹���','����ѧ�Ļ���רҵ')
--insert into Student(StuId,StuName,ProfessionalId,ProfessionalName,ProfessionalRemark)
--values('003','�ŷ�',1,'�����','��ţ��רҵ')
--select * from Student
--������������������ʽ���Ż��������£�
--create table Professional
--(
--	ProfessionalId int primary key identity(1,1),--רҵ���
--	ProfessionalName varchar(50),--רҵ����
--	ProfessionalRemark varchar(200), --רҵ����
--)
--create table Student
--(
--	StuId varchar(20) primary key,--ѧ��
--	StuName varchar(20) not null,--ѧ������
--	ProfessionalId int not null,--רҵ���
--)
--insert into Professional(ProfessionalName,ProfessionalRemark) values('�����','��ţ��רҵ')
--insert into Professional(ProfessionalName,ProfessionalRemark) values('���̹���','����ѧ�Ļ���רҵ')
--insert into Student(StuId,StuName,ProfessionalId) values('001','����',1)
--insert into Student(StuId,StuName,ProfessionalId) values('002','����',2)
--insert into Student(StuId,StuName,ProfessionalId) values('003','�ŷ�',1)
--select * from Student
--------------------------------------------------------------------------------------------------------------------------







