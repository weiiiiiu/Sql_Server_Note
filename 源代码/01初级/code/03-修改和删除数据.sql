--�����յ���Ϊÿ��Ա��+500 Ԫ���ʣ������޸ģ�
update People set PeopleSalary = PeopleSalary + 500

--��Ա�����Ϊ8�Ĺ���+1000 Ԫ�����������޸ģ�
update People set PeopleSalary = PeopleSalary + 1000 WHERE PeopleId = 8

--������������ű����֪=1������Ա�����ʵ���1���ȫ��������1 ��
update People set PEOPLESALARY = 10000 WHERE DepartmentId=1 and PEOPLESALARY < 10000

--�޸���������Ϊ��ǰ��2 ���������޸����ַΪ����
UPDATE People SET PEOPLESALARY = PEOPLESALARY*2,PEOPLEADDRESS='����' WHERE PEOPLENAME = '����'

--ɾ��Ա��������������
DELETE FROM People

--ɾ���г���(��֪���ű��=3)�й��ʴ���15000 ������Ա��
DELETE FROM People WHERE DepartmentId = 3 and PEOPLESALARY > 15000

--ɾ��
--drop,delete,truncate
--drop table:ɾ����
--delete,truncate table:ɾ�������������

--delete:���Ը��������Զ����,123,ʹ��deleteɾ���������ݣ��������,4,5,6
--truncate table:���ܸ��������Զ���Ź�������������Զ����,123,ʹ��truncate tableɾ���������ݣ��������,1,2,3