--�α�:����ֱ��ָ��ĳ������

select * from Student

--�����α�(ֻ��)
declare StuYb cursor for
select StuName from Student
open StuYb --���α� 

close StuYb --�ر��α�



--����ֻ���α�ѭ����ʾѧ������
fetch next from StuYb
while @@FETCH_STATUS = 0 --����״̬�����Զ���һ����
begin
	fetch next from StuYb
end

--ɾ���α�
deallocate StuYb
--�����α꣨�����α꣩
declare StuYb cursor scroll for
select * from Student
open StuYb
--��ȡ��һ��
fetch next from StuYb
--��ȡ��һ��
fetch prior from StuYb
--��ȡ��һ��
fetch first from StuYb
--��ȡ���һ��
fetch last from StuYb
--��ȡ�����������Ե��������ӵ�һ����ʼ����������
fetch absolute 3 from StuYb
--��ȡ����������Ե��������ӵ�ǰλ�ÿ�ʼ����������
fetch relative 3 from StuYb

--��ѯ����5�����ݣ�����ţ��������Ա�ֱ�ʹ��3����������������ӡ
declare @StuId int
declare @StuName varchar(30)
declare @StuSex varchar(30)
fetch absolute 5 from StuYb into @StuId,@StuName,@StuSex
print cast(@StuId as varchar(10)) + ',' + @StuName + ',' + @StuSex

--�޸ĵ�5�����ݣ����Ա��޸ĳ�Ů����5�����ݵı�ţ��������Ա𶼲�֪����
fetch absolute 5 from StuYb
update Student set StuSex = 'Ů' where CURRENT of StuYb
select * from Student

--ɾ����10�����ݣ�����10�����ݵı�ţ��������Ա𶼲�֪����
fetch absolute 10 from StuYb
delete from Student where CURRENT of StuYb

--������ϵͳ�������Զ��庯����
--�Զ��庯����1-����ֵ������2-��ֵ������
--�����е����н����ܺ�
create function funSumMoney()
returns money
as
begin
	declare @sumMoney money
	select @sumMoney = (select SUM(CardMoney) from BankCard)
	return @sumMoney
end
go

print dbo.funSumMoney()

--����һ�����֤���룬����˵��������п��ܽ��



select SUM(CardMoney) from BankCard




