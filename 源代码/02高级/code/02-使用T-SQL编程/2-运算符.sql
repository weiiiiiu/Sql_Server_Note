--T-SQL��ʹ�õ��������Ϊ7��
--������������ӣ�+��������-�����ˣ�*��������/����ģ��%�� 
--�߼��������AND��OR��LIKE��BETWEEN��IN��EXISTS��NOT��ALL��ANY�� 
--��ֵ�������= 
--�ַ����������+ 
--�Ƚ��������=��>��<��>=��<=��<> 
--λ�������|��&��^ 
--�����������+=��-=��/=��%=��*=
-----------------------------------------------------------------------------------------------------

--���������
--exp:��֪�����εĳ��Ϳ��󳤷��ε��ܳ������
--declare @c int = 5
--declare @k int = 10
--declare @zc int
--declare @mj int
--set @zc = (@c+@k)*2
--set @mj = @c * @k
--print '�ܳ�Ϊ:' + Convert(varchar(20),@zc)
--print '���Ϊ:' + Convert(varchar(20),@mj)
-----------------------------------------------------------------------------------------------------------


--�߼������
--exp1:��ѯ���п�״̬Ϊ���ᣬ��������1000000�����п���Ϣ
--select * from BankCard where CardState = 3 and CardMoney > 1000000
--exp2:��ѯ�����п�״̬Ϊ�������������0�����п���Ϣ
--select * from BankCard where CardState = 3 or CardMoney = 0
--exp3:��ѯ�������к���'��'���˻���Ϣ�Լ����п���Ϣ
--select * from AccountInfo left join BankCard on AccountInfo.AccountId = BankCard.AccountId
--where RealName like '%��%'
--exp4:��ѯ�������2000-5000֮������п���Ϣ
--select * from BankCard where CardMoney between 2000 and 5000
--exp5:��ѯ�����п�״̬Ϊ�������ע�������п���Ϣ
--select * from BankCard where CardState in(3,4)


--�������֤��420107198905064135
--�������֤��420107199507104133
--�ŷ����֤��420107199602034138
--exp5:������������������ѯ���֤���˻����Ƿ���ڣ�
--����������п��������������򲻿���ֱ�ӿ���
--declare @AccountId int
--if exists(select * from AccountInfo where AccountCode = '420107199507104133')
--	begin		
--		select @AccountId = (select AccountId from AccountInfo where AccountCode = '420107199507104133')
--		insert into BankCard(CardNo,AccountId,CardPwd,CardMoney,CardState)
--		values('6225456875357896',@AccountId,'123456',0,1)				
--	end
--else
--	begin
--		insert into AccountInfo(AccountCode,AccountPhone,RealName,OpenTime)
--		values('420107199507104133','13335645213','����',GETDATE())
--		set @AccountId = @@identity
--		insert into BankCard(CardNo,AccountId,CardPwd,CardMoney,CardState)
--		values('6225456875357896',@AccountId,'123456',0,1)		
--	end
--select * from AccountInfo
--select * from BankCard
--��������Ҳ����ʹ��not exists�����жϣ���ʾ������

--��չ�������������һ�����Ƽ�һ�������ֻ�ܿ�3�����п���
--declare @AccountId int
--declare @count int
--if exists(select * from AccountInfo where AccountCode = '420107199507104133')
--	begin		
--		select @AccountId = (select AccountId from AccountInfo where AccountCode = '420107199507104133')
--		select @count = (select COUNT(*) from BankCard where AccountId = @AccountId)
--		if @count <= 2
--			begin
--				insert into BankCard(CardNo,AccountId,CardPwd,CardMoney,CardState)
--				values('6225456875357898',@AccountId,'123456',0,1)	
--			end	
--		else
--			begin
--				print 'һ�������ֻ�ܰ����������п�'
--			end		
--	end
--else
--	begin
--		insert into AccountInfo(AccountCode,AccountPhone,RealName,OpenTime)
--		values('420107199507104133','13335645213','����',GETDATE())
--		set @AccountId = @@identity
--		insert into BankCard(CardNo,AccountId,CardPwd,CardMoney,CardState)
--		values('6225456875357898',@AccountId,'123456',0,1)		
--	end
	
--select * from AccountInfo
--select * from BankCard


--exp6:��ѯ���п��˻����ǲ������е��˻���������3000
--if 3000 < ALL(select CardMoney from BankCard) 
--	print '�����˻���������3000'
--else
--	print '������������3000���˻�'

--exp7:��ѯ���п��˻����Ƿ����˻�����30000000����Ϣ
--if 30000000 < ANY(select CardMoney from BankCard) 
--	print '�����˻�����30000000���˻�'
--else
--	print '�������˻�����30000000���˻�'
----------------------------------------------------------------------------------------------------------










