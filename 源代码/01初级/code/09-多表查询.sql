 --������Ӳ�ѯ
 select * from People,Department  --��ѯ�����������һ�� �ѿ����˻�

 --�򵥶���ѯ(���������⽨��ϵ�����ݲ�����ʾ)
 --��ѯԱ����Ϣ��ͬʱ��ʾ��������
 select * from People,Department where People.DepartmentId = Department.DepartmentId 
 --��ѯԱ����Ϣ��ͬʱ��ʾְ������
 select * from People,Rank where People.RankId = Rank.RankId
 --��ѯԱ����Ϣ��ͬʱ��ʾ�������ƣ�ְλ����
 select * from People,Department,Rank
 where People.DepartmentId = Department.DepartmentId and People.RankId = Rank.RankId

 --������(���������⽨��ϵ�����ݲ�����ʾ)
 --��ѯԱ����Ϣ��ͬʱ��ʾ��������
 select * from People inner join Department on People.DepartmentId = Department.DepartmentId 
 --��ѯԱ����Ϣ��ͬʱ��ʾְλ����
 select * from People inner join Rank on People.RankId = Rank.RankId
 --��ѯԱ����Ϣ��ͬʱ��ʾ�������ƣ�ְλ����
 select * from People inner join Department on People.DepartmentId = Department.DepartmentId 
 inner join Rank on People.RankId = Rank.RankId

 --�����ӣ��������ӣ��������ӣ�ȫ�����ӣ�
 --��������(�����Ϊ������ʾȫ�����ݣ��������ϵ�Ҳ������ݵĵط�nullȡ��)
  --��ѯԱ����Ϣ��ͬʱ��ʾ��������
 select * from People left join Department on People.DepartmentId = Department.DepartmentId 
 --��ѯԱ����Ϣ��ͬʱ��ʾְλ����
 select * from People left join Rank on People.RankId = Rank.RankId
 --��ѯԱ����Ϣ��ͬʱ��ʾ�������ƣ�ְλ����
 select * from People left join Department on People.DepartmentId = Department.DepartmentId 
 left join Rank on People.RankId = Rank.RankId
 -- A left join B  ==  B right join A

 --ȫ���������ű���������ݱ���ȫ����ʾ��
   --��ѯԱ����Ϣ��ͬʱ��ʾ��������
 select * from People full join Department on People.DepartmentId = Department.DepartmentId 
 --��ѯԱ����Ϣ��ͬʱ��ʾְλ����
 select * from People full join Rank on People.RankId = Rank.RankId
 --��ѯԱ����Ϣ��ͬʱ��ʾ�������ƣ�ְλ����
 select * from People full join Department on People.DepartmentId = Department.DepartmentId 
 full join Rank on People.RankId = Rank.RankId




--��ѯ���人�������е�Ա����Ϣ��Ҫ����ʾ���������Լ�Ա������ϸ���ϡ�
select PeopleName ����,People.DepartmentId ���ű�� ,DepartmentName ��������,
PeopleSex �Ա�,PeopleBirth ����,
PeopleSalary ��н,PeoplePhone �绰,PeopleAddress ����
from People left join DEPARTMENT on Department.DepartmentId = People.DepartmentId
where PeopleAddress = '�人'

--��ѯ���人�������е�Ա����Ϣ��Ҫ����ʾ�������ƣ�ְ�������Լ�Ա������ϸ���ϡ�
select PeopleName ����,DepartmentName ��������,RankName ְλ����,
PeopleSex �Ա�,PeopleBirth ����,
PeopleSalary ��н,PeoplePhone �绰,PeopleAddress ����
from People left join DEPARTMENT on Department.DepartmentId = People.DepartmentId
left join [Rank] on [Rank].RankId = People.RankId
where PeopleAddress = '�人'

--���ݲ��ŷ���ͳ��Ա��������Ա�������ܺͣ�ƽ�����ʣ���߹��ʺ���͹��ʡ�
--��ʾ���ڽ��з���ͳ�Ʋ�ѯ��ʱ����Ӷ������ϲ�ѯ��
select DepartmentName ��������,COUNT(*) ����,SUM(PeopleSalary) �����ܺ�,
AVG(PeopleSalary) ƽ������,MAX(PeopleSalary) ��߹���,MIN(PeopleSalary) ��͹��� 
from People left join DEPARTMENT on Department.DepartmentId = People.DepartmentId
group by Department.DepartmentId,DepartmentName

--���ݲ��ŷ���ͳ��Ա��������Ա�������ܺͣ�ƽ�����ʣ���߹��ʺ���͹��ʣ�
--ƽ��������10000 ���µĲ�����ͳ�ƣ����Ҹ���ƽ�����ʽ������С�
--��ʾ���ڽ��з���ͳ�Ʋ�ѯ��ʱ����Ӷ������ϲ�ѯ��
select DepartmentName ��������,COUNT(*) ����,SUM(PeopleSalary) �����ܺ�,
AVG(PeopleSalary) ƽ������,MAX(PeopleSalary) ��߹���,MIN(PeopleSalary) ��͹��� 
from People left join DEPARTMENT on Department.DepartmentId = People.DepartmentId
group by Department.DepartmentId,DepartmentName
having AVG(PeopleSalary) >= 10000
order by AVG(PeopleSalary) desc

--���ݲ������ƣ�Ȼ�����ְλ���ƣ�
--����ͳ��Ա��������Ա�������ܺͣ�ƽ�����ʣ���߹��ʺ���͹���
select DepartmentName ��������,RANKNAME ְ������,COUNT(*) ����,SUM(PeopleSalary) �����ܺ�,
AVG(PeopleSalary) ƽ������,MAX(PeopleSalary) ��߹���,MIN(PeopleSalary) ��͹��� 
from People 
LEFT JOIN DEPARTMENT on Department.DepartmentId = People.DepartmentId
LEFT JOIN [Rank] on [Rank].RANKID = People.RANKID
group by Department.DepartmentId,DepartmentName,[Rank].RANKID,RANKNAME





--������
 
--��ѯ���ź��ϼ�����
create table Dept
(
	DeptId int primary key,  --���ű��
	DeptName varchar(50) not null, --��������
	ParentId int not null,  --�ϼ����ű��
)

insert into Dept(DeptId,DeptName,ParentId)
values(1,'�����',0)
insert into Dept(DeptId,DeptName,ParentId)
values(2,'Ӳ����',0)

insert into Dept(DeptId,DeptName,ParentId)
values(3,'����з���',1)
insert into Dept(DeptId,DeptName,ParentId)
values(4,'������Բ�',1)
insert into Dept(DeptId,DeptName,ParentId)
values(5,'���ʵʩ��',1)

insert into Dept(DeptId,DeptName,ParentId)
values(6,'Ӳ���з���',2)
insert into Dept(DeptId,DeptName,ParentId)
values(7,'Ӳ�����Բ�',2)
insert into Dept(DeptId,DeptName,ParentId)
values(8,'Ӳ��ʵʩ��',2)

select * from Dept
select * from Dept
--ʵ�����²�ѯ�����Ϊ
--���ű��      ��������     �ϼ�����
-- 3           ����з���     �����
-- 4           ������Բ�     �����
-- 5           ���ʵʩ��     �����
-- 6           Ӳ���з���     Ӳ����
-- 7           Ӳ�����Բ�     Ӳ����
-- 8           Ӳ��ʵʩ��     Ӳ����


select A.DeptId ���ű��,A.DeptName ��������,B.DeptName �ϼ����� from Dept A 
inner join Dept B on A.ParentId = B.DeptId
