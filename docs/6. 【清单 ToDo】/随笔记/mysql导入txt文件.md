https://www.cnblogs.com/madman-fly/p/10742724.html
【图片见原文】

1.首先在命令行启动mysql

  net start mysql


![](https://img2018.cnblogs.com/blog/1612697/201904/1612697-20190420200545001-1769864324.png)

2.登录MySQL（建议使用非root用户）

 mysql --local-infile=1 -u one -p


![](https://img2018.cnblogs.com/blog/1612697/201904/1612697-20190420201658791-1381031511.png)

3.创建数据库
如 CREATE DATABASE menagerie;

在使用在这个数据库
use menagerie

![](https://img2018.cnblogs.com/blog/1612697/201904/1612697-20190420202140624-1006608963.png)

创建表

如：CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20),
        species VARCHAR(20), sex CHAR(1), birth DATE, death DATE);

创建后可以检查一下

show tables

![](https://img2018.cnblogs.com/blog/1612697/201904/1612697-20190420205104915-1490000600.png)

验证表是否按预期方式创建

 DESCRIBE pet;

![](https://img2018.cnblogs.com/blog/1612697/201904/1612697-20190420210122798-760808132.png)

4.创建好txt文件（最好存放在根目录下方便查找）

在数据库中导入

LOAD DATA LOCAL INFILE 'C:\pet.txt' INTO TABLE pet;

若报错

![](https://img2018.cnblogs.com/blog/1612697/201904/1612697-20190420210458100-594278701.png)

可将其改为绝对路径

LOAD DATA LOCAL INFILE 'C:\\pet.txt' INTO TABLE pet;

即可导入成功

![](https://img2018.cnblogs.com/blog/1612697/201904/1612697-20190420210752513-1266477457.png)

select * from pet；

![](
![](./media//202101/2021-01-23_194828.png))

至此完成所有工作。