select * from People
--ģ����ѯ��like  ͨ��� % _ []��
--��ѯ������Ա����Ϣ % ��0 ���ַ���1  һ���ַ�������ַ�
select * from People  where PeopleName like '��%';

--��ѯ�����к��� " �� " ��Ա����Ϣ
select * from People  where PeopleName like '%��%';

--2 ����ʾ�����к��С��С����ߡ�ʷ����Ա����Ϣ��
select * from People  where PeopleName like '%��%' or PeopleName like '%ʷ%'

--��ѯ������Ա����������2 ���� _:����ֻ��һ���ַ�
select * from People  where PeopleName like '��_'
select * from People where SUBSTRING(PeopleName,1,1) = '��' and LEN(PeopleName) = 2

--��ѯ���������һ�������㣬����һ�������ֵ�Ա����Ϣ
select * from People  where PeopleName like '__��'
select * from People where SUBSTRING(PeopleName,3,1) = '��' and LEN(PeopleName) = 3

--��ѯ���绰���뿪ͷ138��Ա����Ϣ
select * from People  where PeoplePhone like '138%'

--��ѯ���绰���뿪ͷ138��Ա����Ϣ,��4λ������7������8 �����һ��������5 
select * from People where PeoplePhone like '138[7,8]%5'

--��ѯ���绰���뿪ͷ133��Ա����Ϣ,��4λ��2-5֮������� �����һ�����벻��2��3
select * from People where PeoplePhone like '133[2,3,4,5]%[^2,3]'
select * from People where PeoplePhone like '133[2-5]%[^2-3]'






