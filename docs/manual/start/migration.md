### 修改数据库表前缀

> 以下内容非最终代码，请不要直接复制运行。

```sql
Select CONCAT( 'ALTER TABLE ', table_name, 'RENAME TO bdc_', substring(table_name,CHAR_LENGTH('oldpre')+1)),';' )
FROM information_schema.tables
Where table_name LIKE 'oldpre_%';
```
