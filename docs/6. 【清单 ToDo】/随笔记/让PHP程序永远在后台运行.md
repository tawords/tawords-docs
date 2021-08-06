让PHP程序永远在后台运行
https://www.cnblogs.com/lookphp/p/5276530.html

PHP里有个函数很有用。这是在最近的开发中才逐渐用到的。
int ignore_user_abort ( [bool setting] )
这个函数的作用是指示服务器端在远程客户端关闭连接后是否继续执行下面的脚本。

setting 参数是一个可选参数。如设置为True，则表示如果用户停止脚本运行，仍然不影响脚本的运行（即：脚本将持续执行）；如果设置为False，则表示当用户停止运行脚本程序时，脚本程序将停止运行。

下面这个例子，在用户关闭浏览器后，该脚本仍然后在服务器上继续执行：


```php
ignore_user_abort(); // 后台运行
set_time_limit(0); // 取消脚本运行时间的超时上限
do {
	sleep(60); // 休眠1分钟
}while(true);
```

------------

```php
<?php
   ignore_user_abort(); // 后台运行
   set_time_limit(0); // 取消脚本运行时间的超时上限
   echo 'start.';
   while(!file_exists('close.txt')){
      $fp = fopen('test.txt','a+');
      fwrite($fp,date("Y-m-d H:i:s") . " 成功了！rn");
      fclose($fp);
      sleep(10);
   }
   echo 'end.';
?>
```