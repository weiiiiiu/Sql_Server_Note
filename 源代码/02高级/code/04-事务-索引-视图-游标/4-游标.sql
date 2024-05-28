create table Member
(
	MemberId int primary key identity(1,1),
	MemberAccount nvarchar(20) unique check(len(MemberAccount) between 6 and 12),
	MemberPwd nvarchar(20),
	MemberNickname nvarchar(20),
	MemberPhone nvarchar(20)
)

insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone)
values('liubei','123456','����','4659874564')
insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone)
values('guanyu','123456','����','42354234124')
insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone)
values('zhangfei','123456','�ŷ�','41253445')
insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone)
values('zhangyun','123456','����','75675676547')
insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone)
values('machao','123456','��','532523523')

--�α꣺��λ���������ĳһ��
--�α���ࣺ
--��1����̬�α�(Static)���ڲ����α��ʱ�����ݷ����仯���α������ݲ���
--��2����̬�α�(Dynamic)���ڲ����α��ʱ�����ݷ����仯���α������ݸı�
--��3�����������α�(KeySet)���ڲ����α��ʱ�򣬱���ʶ���з����ı䣬�α������ݸı䣬�����иı䣬�α������ݲ���

--����һ����̬�α꣬
select * from Member
--1.�����α�(Scroll��������α꣬����Scroll����ֻ���ģ�ֻ��֧��fetch next)
declare CURSORMember cursor scroll
for select MemberAccount from Member
--2.���α�
open  CURSORMember
--3.��ȡ����
fetch first from CURSORMember --������ĵ�һ��
fetch last from CURSORMember  --���һ��
fetch absolute 1 from CURSORMember --���α�ĵ�һ�п�ʼ������n�С�
fetch relative 3 from CURSORMember --�ӵ�ǰλ��������n�С�
fetch next from CURSORMember --��ǰλ�õ���һ��
fetch prior from CURSORMember --��ǰλ�õ���һ��

--4.��ȡ���ݸ������Թ����ã�ȡ����3���û�������ѯ���û���ϸ��Ϣ��
--declare @MemberAccount varchar(30)
--fetch absolute 3 from CURSORMember into @MemberAccount
--select * from Member where MemberAccount = @MemberAccount


--5.�����α���ȡ���е��˻���Ϣ
--����һ��
fetch absolute 1 from CURSORMember
while @@FETCH_STATUS = 0  --@@FETCH_STATUS=0,��ȡ�ɹ���-1��ȡʧ�ܣ�-2�в�����
	begin
		fetch next from CURSORMember
	end
--��������
declare @MemberAccount varchar(30)
--fetch next from CURSORMember into @MemberAccount
fetch absolute 1 from CURSORMember into @MemberAccount
while @@FETCH_STATUS = 0  --@@FETCH_STATUS=0,��ȡ�ɹ���-1��ȡʧ�ܣ�-2�в�����
	begin
		print '��ȡ�ɹ�:' + @MemberAccount
		fetch next from CURSORMember into @MemberAccount
	end




--6.�����α��޸ĺ�ɾ������
fetch absolute 3 from CURSORMember
update Member set MemberPwd = '1234567' where Current of CURSORMember

fetch absolute 3 from CURSORMember
delete Member where Current of CURSORMember

select * from Member

--7.�ر��α�
close CURSORMember
--8.ɾ���α�
deallocate CURSORMember


--9.�����α�ָ��ĳ�ж�������,��ѭ����ʾ����
declare CURSORMember cursor scroll
for select MemberAccount,MemberPwd,MemberNickname,MemberPhone from Member

open CURSORMember

declare @MemberAccount varchar(30)
declare	@MemberPwd nvarchar(20)
declare	@MemberNickname nvarchar(20)
declare	@MemberPhone nvarchar(20)
fetch next from CURSORMember into @MemberAccount,@MemberPwd,@MemberNickname,@MemberPhone
while @@FETCH_STATUS = 0  --@@FETCH_STATUS=0,��ȡ�ɹ���-1��ȡʧ�ܣ�-2�в�����
	begin
		print '��ȡ�ɹ�:' + @MemberAccount+','+@MemberPwd+','+@MemberNickname+','+@MemberPhone
		fetch next from CURSORMember into @MemberAccount,@MemberPwd,@MemberNickname,@MemberPhone
	end
close CURSORMember


