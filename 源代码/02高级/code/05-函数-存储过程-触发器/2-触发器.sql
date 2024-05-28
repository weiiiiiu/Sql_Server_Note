--���������ࣺ��1�� ��Instead of����������2����After��������
--��1�� ��Instead of������������ִ�в���֮ǰ��ִ��
--��2����After������������ִ�в���֮��ִ��
--����
create table Department
(
	DepartmentId varchar(10) primary key , --�������Զ�����
	DepartmentName nvarchar(50), --��������
)
--��Ա��Ϣ
create table People
(
	PeopleId int primary key identity(1,1), --����,�Զ�����
	DepartmentId varchar(10), --���ű��,���,�벿�ű����
	PeopleName nvarchar(20), --��Ա����
	PeopleSex nvarchar(2), --��Ա�Ա�
	PeoplePhone nvarchar(20), --�绰����ϵ��ʽ
)
insert into Department(DepartmentId,DepartmentName)
values('001','�ܾ���')
insert into Department(DepartmentId,DepartmentName)
values('002','�г���')
insert into Department(DepartmentId,DepartmentName)
values('003','���²�')
insert into Department(DepartmentId,DepartmentName)
values('004','����')
insert into Department(DepartmentId,DepartmentName)
values('005','�����')
insert into People(DepartmentId,PeopleName,PeopleSex,PeoplePhone)
values('001','����','��','13558785478')
insert into People(DepartmentId,PeopleName,PeopleSex,PeoplePhone)
values('001','����','��','13558788785')
insert into People(DepartmentId,PeopleName,PeopleSex,PeoplePhone)
values('002','�ŷ�','��','13698547125')

select * from Department
select * from People
--exp:���Ա����ʱ��������ű���Ҳ��������Զ���Ӳ�����Ϣ����������Ϊ"�²���"
create trigger tri_InsertPeople on People
after insert
as
if not exists(select * from Department where DepartmentId = (select DepartmentId from inserted))
	insert into Department(DepartmentId,DepartmentName)
	values((select DepartmentId from inserted),'�²���')
go
insert People(DepartmentId,PeopleName,PeopleSex,PeoplePhone)
values('009','����','��','13854587456')



--exp:������ʵ�֣�ɾ��һ�����ŵ�ʱ�򽫲���������Ա��ȫ��ɾ��	
create trigger tri_DeleteDept on Department
after delete
as
delete from People where People.DepartmentId = 
(select DepartmentId from deleted)
go

select * from Department
select * from People
delete Department where DepartmentId = '001'



drop trigger tri_DeleteDept
--exp:����һ����������ɾ��һ�����ŵ�ʱ���жϸò������Ƿ���Ա��������ɾ����û����ɾ��
create trigger tri_DeleteDept on Department
Instead of delete
as
  if not exists(select * from People where DepartmentId = (select DepartmentId from deleted))
  begin
	delete from Department where DepartmentId = (select DepartmentId from deleted)
  end
go
delete Department where DepartmentId = '001'
delete Department where DepartmentId = '002'
delete Department where DepartmentId = '003'



--exp:�޸�һ�����ű��֮�󣬽��ò���������Ա���Ĳ��ű��ͬ�������޸�
--create trigger tri_UpdateDept on Department
--after update
--as
--	update People set DepartmentId = (select DepartmentId from inserted)
--	where DepartmentId = (select DepartmentId from deleted)
--go
--select * from Department
--select * from People
--update Department set DepartmentId = 'zjb001' where DepartmentId='001'

