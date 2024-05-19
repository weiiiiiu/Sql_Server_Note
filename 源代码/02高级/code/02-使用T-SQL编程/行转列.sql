--ѧ����Ϣ��
create table TB_Student
(
	StuId int primary key,  --ѧ�����
	StuName varchar(50)     --ѧ������
)
insert into TB_Student(StuId,StuName) values(1,'����')
insert into TB_Student(StuId,StuName) values(2,'����')
insert into TB_Student(StuId,StuName) values(3,'�ŷ�')
--���Գɼ���
create table TB_Exam
(
	ExamId int primary key,  --���Ա��
	StuId int,--ѧ�����
	ExamSubject varchar(50), --���Կ�Ŀ
	ExamScore int --���Գɼ�
)
insert into TB_Exam(ExamId,StuId,ExamSubject,ExamScore)
values(1,1,'����',90)
insert into TB_Exam(ExamId,StuId,ExamSubject,ExamScore)
values(2,1,'��ѧ',80)
insert into TB_Exam(ExamId,StuId,ExamSubject,ExamScore)
values(3,3,'����',100)
select * from TB_Student
select * from TB_Exam

--����һ����ѯ����ѧ�������Ŀ��Գɼ���������
--��ʾ��������Ա�ţ�ѧ����ţ�ѧ�����������Գɼ�
select ExamId ���Ա��,TB_Exam.StuId ѧ�����,StuName ѧ������,ExamScore ���Գɼ�
from TB_Exam inner join TB_Student on TB_Exam.StuId = TB_Student.StuId
where ExamSubject = '����'

--�������ͳ������ѧ���μӵĿ��Դ�����ƽ���÷�
--��ʾ�����ѧ����ţ�ѧ�����������Դ�����ƽ���÷�
select TB_Exam.StuId ѧ�����,StuName ѧ������,COUNT(*) ���Դ���,AVG(ExamScore) ƽ���÷�
from TB_Exam inner join TB_Student on TB_Exam.StuId = TB_Student.StuId
group by TB_Exam.StuId,StuName

--�������������¸�ʽͳ�ƿ��Գɼ���������
--��ʾ���:ѧ����ţ�ѧ�����������ģ���ѧ
select TB_Student.StuId ѧ�����,StuName ѧ������,
max(case ExamSubject when '����' then ExamScore else 0 end) ����,
max(case ExamSubject when '��ѧ' then ExamScore else 0 end) ��ѧ
from TB_Exam inner join TB_Student on TB_Exam.StuId = TB_Student.StuId
group by TB_Student.StuId,StuName


--��չ��̬
DECLARE @sql VARCHAR(max)
SET @sql = 'select TB_Student.StuId ѧ�����,StuName ѧ������,'   
SELECT @sql = @sql + 'max(CASE ExamSubject WHEN '''+[ExamSubject]+''' THEN [ExamScore] ELSE 0 END) AS '''+ExamSubject+''','   
FROM (SELECT DISTINCT [ExamSubject] FROM [TB_Exam]) AS a     
SELECT @sql = LEFT(@sql,LEN(@sql)-1) + ' FROM [TB_Exam] inner join TB_Student on TB_Exam.StuId = TB_Student.StuId GROUP BY TB_Student.StuId,StuName'   
PRINT(@sql)
EXEC(@sql)
GO

--��������չ(ʹ��pivot������ת��)
select * from
(select TB_Student.StuId,StuName,ExamScore,ExamSubject from TB_Exam 
inner join TB_Student on TB_Exam.StuId = TB_Student.StuId) a
pivot
(
	max(ExamScore) for
	a.ExamSubject in([����],[��ѧ])
) as b

--��չ��̬
declare @sql varchar(max)
declare @sqlCol varchar(max)
SELECT @sqlCol = ISNULL(@sqlCol + ',','') + ExamSubject FROM TB_Exam GROUP BY ExamSubject
set @sql = ' select * from '
set @sql = @sql + ' (select TB_Student.StuId,StuName,ExamScore,ExamSubject from TB_Exam '
set @sql = @sql + ' inner join TB_Student on TB_Exam.StuId = TB_Student.StuId) a '
set @sql = @sql + ' pivot '
set @sql = @sql + ' ( '
set @sql = @sql + ' max(ExamScore) for '
set @sql = @sql + ' a.ExamSubject in( '
set @sql = @sql + @sqlCol
set @sql = @sql + ' )'
set @sql = @sql + ' ) as b '
print (@sql)
exec (@sql)

--��չ��̬
declare @sql varchar(max)
declare @sqlCol varchar(max)
SELECT @sqlCol = ISNULL(@sqlCol + ',','') + ExamSubject FROM TB_Exam GROUP BY ExamSubject
print @sqlCol
set @sql = '
select * from  
(select TB_Student.StuId,StuName,ExamScore,ExamSubject from TB_Exam  
inner join TB_Student on TB_Exam.StuId = TB_Student.StuId) a  
pivot  
(  
     max(ExamScore) for  
     a.ExamSubject in( '+@sqlCol+' ) 
) as b '
print (@sql)
exec (@sql)

