create table Member
(
	MemberId int primary key identity(1,1),
	MemberAccount nvarchar(20) unique check(len(MemberAccount) between 6 and 12),
	MemberPwd nvarchar(20),
	MemberNickname nvarchar(20),
	MemberPhone nvarchar(20),
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

select * from Member

--��ӻ�Ա�Ĵ洢����
create proc proc_MemberAdd
@MemberAccount varchar(20),
@MemberPwd varchar(20),
@MemberNickname varchar(20),
@MemberPhone varchar(20)
as
insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone) 
values(@MemberAccount,@MemberPwd,@MemberNickname,@MemberPhone)
print @@error
go
drop proc proc_MemberAdd
--547:check����
--2627:ΨһԼ��

exec proc_MemberAdd 'liubei','1','1','1'


create proc proc_MemberInsert
	@MemberAccount varchar(20),
	@MemberPwd varchar(20),
	@MemberNickname varchar(20),
	@MemberPhone varchar(20)
as
	insert into Member(MemberAccount,MemberPwd,MemberNickname,MemberPhone) 
	values(@MemberAccount,@MemberPwd,@MemberNickname,@MemberPhone)
	declare @myErr int = @@error
	if @myErr = 0
		return 1
	else if @myErr = 547
		return -1
	else if @myErr = 2627
		return -2
	else
		return -100
go

select * from Member
--�����û�������绰�����������
create proc proc_GetPhoneByAccount
	@MemberAccount varchar(20),
	@MemberPhone varchar(20) output
as
	select @MemberPhone =
	(select MemberPhone from Member where MemberAccount = @MemberAccount)
go

declare @MemberPhone varchar(20)
exec proc_GetPhoneByAccount 'guanyu',@MemberPhone output
print @MemberPhone




