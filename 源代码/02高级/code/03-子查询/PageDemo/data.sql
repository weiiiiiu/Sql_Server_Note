--ѧ������ţ��������Ա�
--���30�����Լ�¼
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

select * from Student

--����һ��top��ҳ
declare @PageSize int = 5 --��ҳ��С��һҳ�м������ݣ�
declare @PageIndex int = 1 --��ǰҳ
select top(@PageSize) * from Student 
where StuId not in (select top ((@PageIndex-1)*@PageSize) StuId from Student)


--��������row_number��ҳ
declare @PageSize int = 5 --��ҳ��С��һҳ�м������ݣ�
declare @PageIndex int = 1 --��ǰҳ
select * from 
(select ROW_NUMBER() over(order by StuId) RowId,* from Student) Temp
where RowId between (@PageIndex-1)*@PageSize+1 and @PageIndex*@PageSize