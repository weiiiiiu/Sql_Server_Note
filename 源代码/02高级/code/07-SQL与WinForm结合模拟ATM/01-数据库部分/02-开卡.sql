--��д�洢����ʵ���Զ��������п������п������Զ����ɹ������£�
--��1��ǰ2λ�̶�Ϊ 66 ��2��3-10λΪ����ǰ���ڣ����磺20180919��
--��3�����8λ�Զ������������һ����00000001���ڶ�����00000002
select * from BankCard
--cardNo				AccountId	CardPwd		CardMOney		CardState	CardTime
--662018092100000001	1			123456		0				1			2018-9-21......

create proc proc_AutoCardNo
@carNo varchar(18) output
as
	declare @maxStr varchar(8)  --���8λ
	declare @maxNum int --���8λ
	declare @newStr varchar(8)--�¿���8λ
	declare @newNum int --�¿���8λ
	if exists(select * from BankCard 
	where YEAR(CardTime)=YEAR(GETDATE()) and month(CardTime)=month(GETDATE()) and day(CardTime)=day(GETDATE()))
		begin
			--ȡ������쿨��󿨺ŵ����8λ
			select @maxStr = 
			(select max(substring(cardNo,11,8)) from BankCard
			where cardNo like '66'+Convert(varchar(8),GETDATE(),112) + '%'
			)
			print @maxStr
			set @maxNum = CAST(@maxStr as int)
			print @maxNum
			set @newNum = @maxNum + 1
			print @newNum
			set @newStr = RIGHT('0000000'+CAST(@newNum as varchar(8)),8)
			print @newStr
			set @carNo = '66' + Convert(varchar(8),GETDATE(),112) + @newStr
			print @carNo
		end
	else
		begin
			set @carNo = '66' + Convert(varchar(8),GETDATE(),112) + '00000001'
			print @carNo
		end
go

drop proc proc_AutoCardNo

declare @cardNo varchar(18)
exec proc_AutoCardNo @cardNo output

select @cardNo


















--��д�洢����ʵ�ֿ���
--������֪�����У����֤���绰�����������п�����
--ҵ���߼���
--��1��������֤���˻���Ϣ�в����ڣ�������˻���Ϣ��������п���Ϣ����������ʹ������֤����׼ȷ�ԣ�
--��2��������֤���˻���Ϣ�д��ڣ�ֱ��������п���Ϣ


--���������¼�������Ϣ����Ҫ���п�������
--���֤				�绰			����		���п�����
--420107198811114152	13889898989		����		123456		
--420107198310184521	13636363636		����		123456
--420107198909053125	13456565656		�ŷ�		123456


create proc proc_CreateCard
@code varchar(20),--���֤
@phone varchar(20),--�绰
@realname varchar(20),--����
@pwd varchar(20),--����
@cardno varchar(18) output
as
	exec proc_AutoCardNo @cardno output
	declare @AccountId int 
	if exists(select * from AccountInfo where AccountCode = @code) --���ڣ�ֱ�ӿ���
		begin				
			select @AccountId = (select AccountId from AccountInfo where AccountCode = @code)		
			insert into BankCard(CardNo,AccountId,CardPwd,CardMoney,CardState,CardTime)
			values(@cardno,@AccountId,@pwd,0,1,GETDATE())
		end
	else--�����ڣ��ȿ������ڿ���
		begin
			begin transaction
			declare @myErr int = 0
			insert into AccountInfo(AccountCode,AccountPhone,RealName,OpenTime)
			values(@code,@phone,@realname,GETDATE())
			set @myErr = @myErr + @@ERROR
			set @AccountId = @@identity
			insert into BankCard(CardNo,AccountId,CardPwd,CardMoney,CardState,CardTime)
			values(@cardno,@AccountId,@pwd,0,1,GETDATE())
			set @myErr = @myErr + @@ERROR
			if 	@myErr = 0
				commit transaction
			else
				begin
				set @cardno = ''
				rollback transaction
				end		
		end

go




--���֤				�绰			����		���п�����
--420107198811114152	13889898989		����		123456		
--420107198310184521	13636363636		����		123456
--420107198909053125	13456565656		�ŷ�		123456
declare @cardno varchar(18)
exec proc_CreateCard '420107198811114152','13889898989','����','123456',@cardno output
select @cardno


exec proc_CreateCard '420107198310184521','13636363636','����','123456',@cardno output
select @cardno


exec proc_CreateCard '420107198909053125','13456565656','�ŷ�','123456',@cardno output
select @cardno

declare @cardno varchar(18)
exec proc_CreateCard '420107198909053128','13456565657','����','123456',@cardno output
select @cardno




















	declare @carNo varchar(20)
	
	declare @maxStr varchar(8)  --���8λ
	declare @maxNum int --���8λ
	declare @newStr varchar(8)--�¿���8λ
	declare @newNum int --�¿���8λ
	if exists(select * from BankCard 
	where Convert(varchar(8),CardTime,112) = Convert(varchar(8),GETDATE(),112))
	begin
		--ȡ������쿨��󿨺ŵ����8λ
		select @maxStr = 
		(select max(substring(cardNo,11,8)) from BankCard
		where cardNo like '66'+Convert(varchar(8),GETDATE(),112) + '%'
		)
		set @maxNum = CAST(@maxStr as int)
		set @newNum = @maxNum + 1
		set @newStr = RIGHT('0000000'+CAST(@newNum as varchar(8)),8)
		set @carNo = '66' + Convert(varchar(8),GETDATE(),112) + @newStr
	end
	else
		set @carNo = '66' + Convert(varchar(8),GETDATE(),112) + '00000001'
		
	print @carNo