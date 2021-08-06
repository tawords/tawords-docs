https://www.cnblogs.com/jhin-wxy/p/8965888.html

### 1、使用processlist，但是有个弊端，就是只能查看正在执行的sql语句，对应历史记录，查看不到。好处是不用设置，不会保存。
```sql
use information_schema;
show processlist;
```
或者：
```sql
select * from information_schema.`PROCESSLIST` where info is not null;
```

------------

### 2、开启日志模式
> 需要root权限
#### 1、设置

```sql
-- 日志开启
SET GLOBAL log_output = 'TABLE'; SET GLOBAL general_log = 'ON';

-- 日志关闭
SET GLOBAL log_output = 'TABLE'; SET GLOBAL general_log = 'OFF';
```

#### 2、查询

```sql
SELECT * from mysql.general_log ORDER BY event_time DESC;
```

#### 3、清空表（delete对于这个表，不允许使用，只能用truncate）

```sql
-- truncate table mysql.general_log;
```


在查询sql语句之后，在对应的`C:\Program Files\MySQL\MySQL Server 5.7\data`文件夹下面有对应的log记录

ps:在查询到所需要的记录之后，应尽快关闭日志模式，占用磁盘空间比较大