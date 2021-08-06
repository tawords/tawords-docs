# 代码
```php
<?php
 echo dirname($_SERVER['PHP_SELF']).'/index.php?c=admin';
 echo '<br>';
 echo dirname('/').'/index.php?c=admin';
 echo '<br>';
 $phpSelf = dirname($_SERVER['PHP_SELF']."apple") == "/" ? "" : dirname($_SERVER['PHP_SELF']);
 echo $phpSelf; exit;
 exit();
```

------------

# 执行结果

```
/* https://www.only4.work/Admin/新建文件.php */
/Admin/index.php?c=admin
//index.php?c=admin
/Admin


/* https://www.only4.work/新建文件.php */
//index.php?c=admin
//index.php?c=admin
```