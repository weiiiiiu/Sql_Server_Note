--�ۺϺ���������-count,���ֵ -max,��Сֵ -min,��� -sum,ƽ��ֵ -avg )

--������
select COUNT(*) ���� from People

--�����ֵ ,���ʵ����ֵ
select MAX(PeopleSalary) ��߹��� from People

--����Сֵ ,���ʵ���Сֵ
select MIN(PeopleSalary) ��͹��� from People

--�����ܺ�
select SUM(PeopleSalary) �����ܺ� from People

--����ƽ��ֵ
select AVG(PeopleSalary) ƽ������ from People

select ROUND(AVG(PeopleSalary),2)  ƽ������ from People

--�����������ֵ����Сֵ���ܺͣ�ƽ��ֵ����һ����ʾ
select COUNT(*) ����,MAX(PeopleSalary) ��߹���,MIN(PeopleSalary) ��͹���
,SUM(PeopleSalary) �����ܺ�,AVG(PeopleSalary) ƽ������ from People

--��ѯ���人������Ա���������ܹ��ʣ���߹��ʣ���͹��ʺ�ƽ�����ʡ�
select '�人' ����,COUNT(*) ����,MAX(PeopleSalary) ��߹���,MIN(PeopleSalary) ��͹���
,SUM(PeopleSalary) �����ܺ�,AVG(PeopleSalary) ƽ������ from People
WHERE PEOPLEADDRESS = '�人'



--������ʱ�ƽ�����ʸߵ���Ա��Ϣ
select * from People where PeopleSalary > (select AVG(PeopleSalary) ƽ������ from People)


--���������������ֵ��������Сֵ�������ܺͣ�����ƽ��ֵ����һ����ʾ
select COUNT(*) ����,
MAX(year(getdate())-year(PeopleBirth)) �������,
MIN(year(getdate())-year(PeopleBirth)) �������,
SUM(year(getdate())-year(PeopleBirth)) �����ܺ�,
AVG(year(getdate())-year(PeopleBirth)) ƽ������ 
from People

select COUNT(*) ����,
MAX(DATEDIFF(year, PeopleBirth, getDate())) �������,
MIN(DATEDIFF(year, PeopleBirth, getDate())) �������,
SUM(DATEDIFF(year, PeopleBirth, getDate())) �����ܺ�,
AVG(DATEDIFF(year, PeopleBirth, getDate())) ƽ������ 
from People

--�������н��10000 ���ϵ�����Ա����������䣬��С�����ƽ�����䡣
select '��' �Ա�,COUNT(*) ����,
MAX(year(getdate())-year(PeopleBirth)) �������,
MIN(year(getdate())-year(PeopleBirth)) �������,
SUM(year(getdate())-year(PeopleBirth)) �����ܺ�,
AVG(year(getdate())-year(PeopleBirth)) ƽ������ 
from People where PeopleSex = '��' and PeopleSalary >= 10000

select '��' �Ա�,COUNT(*) ����,
MAX(DATEDIFF(year, PeopleBirth, getDate())) �������,
MIN(DATEDIFF(year, PeopleBirth, getDate())) �������,
SUM(DATEDIFF(year, PeopleBirth, getDate())) �����ܺ�,
AVG(DATEDIFF(year, PeopleBirth, getDate())) ƽ������ 
from People where PeopleSex = '��' and PeopleSalary >= 10000

--ͳ�Ƴ����ڵ��ڡ��人���Ϻ���������ŮԱ�������Լ�������䣬��С�����ƽ�����䡣
select '�人���Ϻ�' ����,'Ů' �Ա�,COUNT(*) ����,
MAX(year(getdate())-year(PeopleBirth)) �������,
MIN(year(getdate())-year(PeopleBirth)) �������,
SUM(year(getdate())-year(PeopleBirth)) �����ܺ�,
AVG(year(getdate())-year(PeopleBirth)) ƽ������  
from People where PeopleSex = 'Ů' and PeopleAddress in('�人','�Ϻ�')

select '�人���Ϻ�' ����,'Ů' �Ա�,COUNT(*) ����,
MAX(DATEDIFF(year, PeopleBirth, getDate())) �������,
MIN(DATEDIFF(year, PeopleBirth, getDate())) �������,
SUM(DATEDIFF(year, PeopleBirth, getDate())) �����ܺ�,
AVG(DATEDIFF(year, PeopleBirth, getDate())) ƽ������  
from People where PeopleSex = 'Ů' and PeopleAddress in('�人','�Ϻ�')

--��������ƽ������ߵ���Ա��Ϣ
select * from People where 
year(getdate())-year(PeopleBirth) > 
(select AVG(year(getdate())-year(PeopleBirth)) 
from People)

select * from People where 
DATEDIFF(year, PeopleBirth, getDate()) > 
(select AVG(DATEDIFF(year, PeopleBirth, getDate())) 
from People)



