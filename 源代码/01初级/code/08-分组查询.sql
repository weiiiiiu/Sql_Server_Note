--����Ա�����ڵ�������ͳ��Ա������ ,Ա�������ܺ� ,ƽ�����ʣ���߹��ʺ���͹���
select '�人' ����,COUNT(*) ����,MAX(PeopleSalary) ��߹���,MIN(PeopleSalary) ��͹���
,SUM(PeopleSalary) �����ܺ�,AVG(PeopleSalary) ƽ������ from People
 where PeopleAddress = '�人' union
select '����' ����,COUNT(*) ����,MAX(PeopleSalary) ��߹���,MIN(PeopleSalary) ��͹���
,SUM(PeopleSalary) �����ܺ�,AVG(PeopleSalary) ƽ������ from People
 where PeopleAddress = '����'
 --...������������
 --...������������
 
select PeopleAddress ����,COUNT(*) ����,SUM(PeopleSalary) �����ܺ�,
AVG(PeopleSalary) ƽ������,MAX(PeopleSalary) ��߹���,MIN(PeopleSalary) ��͹��� 
from People group by PeopleAddress;


 --����Ա�����ڵ�������ͳ��Ա��������Ա�������ܺͣ�ƽ�����ʣ���߹��ʺ���͹��ʣ�
 --1985 �꼰�Ժ�����Ա��������ͳ�ơ�
select PeopleAddress ����,COUNT(*) ����,SUM(PeopleSalary) �����ܺ�,
AVG(PeopleSalary) ƽ������,MAX(PeopleSalary) ��߹���,MIN(PeopleSalary) ��͹��� 
from People
where PeopleBirth < '1985-1-1'
group by PeopleAddress;


--����Ա�����ڵ�������ͳ��Ա��������Ա�������ܺͣ�ƽ�����ʣ���߹��ʺ���͹��ʣ�
--Ҫ��ɸѡ��Ա������������2 �˼����ϵļ�¼������1985 �꼰�Ժ�����Ա��������ͳ�ơ�
select PeopleAddress ����,COUNT(*) ����,SUM(PeopleSalary) �����ܺ�,
AVG(PeopleSalary) ƽ������,MAX(PeopleSalary) ��߹���,MIN(PeopleSalary) ��͹��� 
from People 
where PeopleBirth < '1985-1-1'
group by PeopleAddress
having COUNT(*) >= 2;



