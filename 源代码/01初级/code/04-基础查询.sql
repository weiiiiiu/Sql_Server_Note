--��ѯ���еĲ���
SELECT * FROM Department

--��ѯ���е�ְ��
SELECT * FROM [Rank]

--��ѯ���е�Ա����Ϣ
SELECT * FROM People

--����ָ���в�ѯ���������Ա���н���绰��
SELECT PeopleName,PeopleSex,PeopleSalary,PeoplePhone from People

--����ָ���в�ѯ,���Զ��������������������Ա���н���绰��
SELECT PeopleName ����,PeopleSex �Ա�,PeopleSalary ����,PeoplePhone �绰 from People

--��ѯ��˾Ա���ĳ��У�����Ҫ�ظ����ݣ�
select distinct PeopleAddress from People;

--���蹤���յ�10%����ѯԭʼ���ʺ͵�����Ĺ��ʣ���ʾ���������Ա���н����н�����н��
SELECT PeopleName ����,PeopleSex �Ա�,PeopleSalary ��н,PeopleSalary*1.1 ��н����н from People

