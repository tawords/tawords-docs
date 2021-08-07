## 登录验证码未加载出来

#### 问题描述

程序安装后登陆时的验证码无法绘制，报 [Warning:  Wrong parameter count for imagettftext() in xxx/captcha.php 错误]


#### 问题出现原因

安装路径中，出现空格、中文字符以及特殊符号，导致调用GD库时无法找到字体文件。


#### 解决方案

1. 将程序安装在无空格、中文字符以及特殊符号的路径下（推荐）
2. 如果不得不安装在特定目录下，请将 `static/font/geneva.ttf` 字体文件复制一份至符合上述要求的路径，然后按照下方说明修改 `api/captcha.php` 文件。

```
// 修改`api/captcha.php`文件以下内容
imagettftext($image, $fontsize, 0, $x, $y, $fontcolor, dirname(__DIR__).'/static/font/geneva.ttf', $fontcontent);

// 为
imagettftext($image, $fontsize, 0, $x, $y, $fontcolor, '复制出来的字体所在路径/geneva.ttf', $fontcontent);

// 注意	1. 不得使用相对路径，要使用绝对路径；
// 	2. 引号不要漏掉了；
// 	3. 修改后记得保存captcha.php文件，然后再刷新页面
```

---------------

## 无法创建SQLite3数据库

> 这个问题一般出现在Windows环境下


#### 解决方案

需要修改php.ini文件

```
extension=pdo_sqlite # 去掉前面的分号
extension=sqlite3  # 去掉前面的分号
sqlite3.extension_dir = "php所在目录/ext" # 去掉前面的分号，并将值设为ext文件夹的路径
```

