---SQL��Ȩ�޹���
--1����¼Ȩ��
--	1��������create login �˺� with password='����'
--				exec sp_addlogin '�˺�', '����'
--	2��ɾ����drop login �˺�
--				exec sp_droplogin '�˺�'
--2�����ݿ����Ȩ��
--	1��������create user �û��� for login �˺�
--				exec sp_grantdbaccess '�˺�'
--	2��ɾ����drop user �û���
--				exec sp_revokedbaccess '�˺�'
--3�������Ȩ��
--	1�����裺grant �������� on ��to�û�
--	2���ջأ�revoke �������� on ��from�û�
--���ͣ����������ǣ�insert,update,delete,select


