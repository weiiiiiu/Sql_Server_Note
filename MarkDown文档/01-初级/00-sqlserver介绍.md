# SQL SERVER介绍

**数据库：**数据库是“按照数据结构来组织、存储和管理数据的仓库”。是一个长期存储在计算机内的、有组织的、可共享的、统一管理的大量数据的集合。

**应用场景：**在软件系统中无处不在，几乎所有的软件系统背后都有数据库，例如（淘宝，QQ，游戏等）。

**数据表展现形式：**

![001](img\001.PNG)

**主流关系型数据库：** SQL SERVER，MySQL，Oracle等。

**数据库的安装：（服务、管理工具）**

（1）在微软官网下载安装程序，https://www.microsoft.com/zh-cn/sql-server/sql-server-downloads

（2）百度搜索"I tell you"，或者访问 https://msdn.itellyou.cn/

![002](img\002.PNG)

**打开数据库：**

（1）启动服务：

​	【1】命令行启动；【2】SQL SERVER配置管理器；【3】Windows服务；

（2）打开SQL SERVER Management Studio，使用工具连接到数据库。

​	【1】Windows身份验证；	【2】SQL SERVER身份验证；

使用.号连接计算机本机服务

 **数据库基本操作：**

（1）建库。

（2）建表。标识规范  实现自增

（3）数据维护。

**数据库的迁移：**（从另一台转到另一台）

（1）数据库的分离、附加；（分离和删除的区别在于硬盘上是否还留存有数据库文件）

数据库属性-文件  、日志文件，管理工具右键 - 任务- 分离 ->复制粘贴mdf、ldf数据文件

恢复：右击数据库-附加-增加

![image-20240519184846458](C:\Users\Administrator\Desktop\sql_server学习资料\004-SQLSERVER数据库\MarkDown文档\01-初级\img\003.png)

（2）数据库的备份，还原；

右键DB-任务-备份

![image-20240519190405057](C:\Users\Administrator\Desktop\sql_server学习资料\004-SQLSERVER数据库\MarkDown文档\01-初级\img\004.png)

删除数据库-数据及日志文件都消失

![image-20240519190721520](C:\Users\Administrator\Desktop\sql_server学习资料\004-SQLSERVER数据库\MarkDown文档\01-初级\img\005.png)

还原：右键数据库-还原

![image-20240519191049380](C:\Users\Administrator\Desktop\sql_server学习资料\004-SQLSERVER数据库\MarkDown文档\01-初级\img\006.png)

（3）数据库脚本的保存；

![image-20240519191308778](C:\Users\Administrator\Desktop\sql_server学习资料\004-SQLSERVER数据库\MarkDown文档\01-初级\img\007.png)

![image-20240519191414823](C:\Users\Administrator\Desktop\sql_server学习资料\004-SQLSERVER数据库\MarkDown文档\01-初级\img\008.png)







