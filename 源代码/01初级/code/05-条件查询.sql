--�Ƚ��������=  !=  >  <  >=  <= (IS NULL)  in  like  (BETWEEN...AND...)��
--�߼��������and or not ��

--����ָ���У��������Ա���н���绰����ѯ�Ա�ΪŮ��Ա����Ϣ,���Զ�����������
SELECT PeopleName ����,PeopleSex �Ա�,PeopleSalary ����,PeoplePhone �绰 from People
WHERE PEOPLESEX = 'Ů'

--��ѯ��н���ڵ���10000 ��Ա����Ϣ( ������ )
select * from People where PeopleSalary >= 10000 

--��ѯ��н���ڵ���10000 ��ŮԱ����Ϣ(������)
select * from People where PeopleSalary >= 10000 and PeopleSex = 'Ů'

--��ʾ������������1980-1-1֮�󣬶�����н���ڵ���10000��ŮԱ����Ϣ��
select * from People where PeopleBirth >= '1980-1-1' 
and PeopleSalary >= 10000 and PeopleSex = 'Ů'

--��ʾ����н���ڵ���15000 ��Ա��,������н���ڵ���8000��ŮԱ����Ϣ��
select * from People where PeopleSalary >= 15000 or
(PeopleSalary >= 8000 and PeoPleSex = 'Ů')

--��ѯ��н��10000-20000 ֮��Ա����Ϣ( ������ ) 
select * from People where PeopleSalary >= 10000 and PeopleSalary <= 20000
select * from People where PeopleSalary  between 10000 and 20000 

--��ѯ����ַ�ڱ��������Ϻ���Ա����Ϣ
select * from People 
where PeopleAddress = '����' or PeopleAddress = '�Ϻ�'
select * from People where PeopleAddress in('����','�Ϻ�')

--��ѯ����Ա����Ϣ(���ݹ������򣬽�������) order by: ����  asc: ����  desc: ����
select * from People order by PeopleSalary desc

--��ʾ���е�Ա����Ϣ���������ֵĳ��Ƚ��е�������
select * from People order by len(PeopleName) desc

--��ѯ������ߵ�5���˵���Ϣ
select top 5 * from People order by PeopleSalary desc

--��ѯ������ߵ�10%��Ա����Ϣ
select top 10 percent * from People order by PeopleSalary desc


insert into People(DepartmentId,RankId,PeopleName,PeopleSex)
values(2,3,'�ͷ���','��')
--��ѯ����ַû����д��Ա����Ϣ
select * from People where PeopleAddress is null

--��ѯ����ַ�Ѿ���д��Ա����Ϣ
select * from People where PeopleAddress is not null


--��ѯ���е�80��Ա����Ϣ
select * from People where PeopleBirth >= '1980-1-1' and PeopleBirth <= '1989-12-31'
select * from People where PeopleBirth between '1980-1-1' and '1989-12-31'
select * from People where year(PeopleBirth) >= 1980 and year(PeopleBirth) <= 1989


--��ѯ������30-40 ֮�䣬���ҹ�����15000-30000 ֮���Ա����Ϣ(between and)
select * from People where
(year(getdate())-year(PeopleBirth) >= 30 and year(getdate())-year(PeopleBirth) <= 40) and
(PeopleSalary >= 15000 and PeopleSalary <= 30000)

select * from People where
( year(getdate())-year(PeopleBirth) between 30 and 40)
and PeopleSalary between 15000 and 30000

--��ѯ����з 6.22--7.22 ��Ա����Ϣ
select * from People where 
(month(PeopleBirth) = 6 and DAY(PeopleBirth) >= 22) or
(month(PeopleBirth) = 7 and DAY(PeopleBirth) <= 22)

--��ѯ���ʱ����Ƹߵ���
select * from People where PeopleSalary > 
(select PeopleSalary from People where PEOPLENAME = '����')

--��ѯ����������ͬһ�����е���
select * from People where PEOPLEADDRESS = 
(select PEOPLEADDRESS from People where PEOPLENAME = '����')

--��ѯ����ФΪ�����Ա��Ϣ
select * from People where year(PeopleBirth) % 12 = 4

--��ѯ����Ա����Ϣ�����һ����ʾ����(��,ţ,��,��,��,��,��,��,��,��,��,��)
select PeopleName ����,PeopleSex �Ա�,PeopleSalary ����,PeoplePhone �绰,PEOPLEBIRTH ����,
case
	when year(PeopleBirth) % 12 = 4 then '��'
	when year(PeopleBirth) % 12 = 5 then 'ţ'
	when year(PeopleBirth) % 12 = 6 then '��'
	when year(PeopleBirth) % 12 = 7 then '��'
	when year(PeopleBirth) % 12 = 8 then '��'
	when year(PeopleBirth) % 12 = 9 then '��'
	when year(PeopleBirth) % 12 = 10 then '��'
	when year(PeopleBirth) % 12 = 11 then '��'
	when year(PeopleBirth) % 12 = 0 then '��'
	when year(PeopleBirth) % 12 = 1 then '��'
	when year(PeopleBirth) % 12 = 2 then '��'
	when year(PeopleBirth) % 12 = 3 then '��'
	ELSE ''
end ��Ф
from People

select PeopleName ����,PeopleSex �Ա�,PeopleSalary ����,PeoplePhone �绰,PEOPLEBIRTH ����,
case year(PeopleBirth) % 12
	when 4 then '��'
	when 5 then 'ţ'
	when 6 then '��'
	when 7 then '��'
	when 8 then '��'
	when 9 then '��'
	when 10 then '��'
	when 11 then '��'
	when 0 then '��'
	when 1 then '��'
	when 2 then '��'
	when 3 then '��'
	ELSE ''
end ��Ф
from People

