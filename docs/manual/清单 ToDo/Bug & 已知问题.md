# 需修复Bug

### 网站查单词刷新采用ajax，校验php的sessionID

### 数据库 表前缀

### 密码使用密文传输保存，不使用明文传输
前台使用`md5(md5(password) + salt)`处理传回后台，`salt`每个用户唯一
后台使用`password_hash`获取前台传回<经过md5处理的密码>的哈希值保存数据库，验证时使用`password_verify`
> // `password_hash`得到的数据类似于
`string(60) "$2y$10$MWf.96gY7Afy70tQoXXV.uRCoS8BOzAbZH10PCu7WCX4oH5FR85Gy"`
// php5.5之后才有`password_hash()`
// 【**参考资料**】 PHP 加密：Password Hashing API：https://blog.csdn.net/weixin_34055910/article/details/93947848
设计安全的账号系统的正确姿势
https://blog.coderzh.com/2016/01/03/security-design/

```php
<?php
$str = 'chicken,run!';
$pwd1 = password_hash($str, PASSWORD_BCRYPT);

var_dump($pwd1);
var_dump(password_verify('chicken,run!', $pwd1));    // 输出 true
var_dump(password_verify('chicken,ran!', $pwd1));    // 输出 false

// var_dump(password_needs_rehash($pwd1, PASSWORD_BCRYPT, ['cost'=>10]));   // 输出 false,因为 password_hash() 在加密时,出来默认 cost 为 10 外,还会指定随机的盐值
```


什么叫给密码“加盐”？如何安全的为你的用户密码“加盐”？
https://zhuanlan.zhihu.com/p/144392745
```php
<?php
/**
 * 随机生成四位字符串的salt
 * 也可以根据实际情况使用6位或更长的salt
 */
function generateSalt()
{
    // 使用随机方式生成一个四位字符
    $chars = array_merge(range('A', 'Z'), range('a', 'z'), range('0', '9'));
    for ($i = 0; $i < 4; $i++) {
        $str .= $chars[mt_rand(0, count($chars) - 1)];
    }
    return $str;
}

/**
 * 密码生成
 * 使用两层hash，将salt加在第二层
 * sha1后再加salt然后再md5
 */
function generateHashPassword($password, $salt)
{
    return md5(sha1($password) . $salt);
}

$pdo = new PDO('mysql:host=localhost;dbname=blog_test;charset=utf8mb4', 'root', '');

$username = 'ZyBlog1';
$password = '123456';

// 注册
function register($username, $password)
{
    global $pdo;

    // 首先判断用户是否已注册
    $pre = $pdo->prepare("SELECT COUNT(id) FROM zyblog_test_user WHERE username = :username");
    $pre->bindParam(':username', $username);
    $pre->execute();
    $result = $pre->fetchColumn();

    // 如果用户名存在，则无法注册
    if ($result > 0) {
        echo '用户名已注册！', PHP_EOL;
        return 0;
    }

    // 生成salt
    $salt = generateSalt();
    // 密码进行加盐hash处理
    $password = generateHashPassword($password, $salt);

    // 插入新用户
    $pre = $pdo->prepare("insert into zyblog_test_user(username, password, salt) values(?, ?, ?)");

    $pre->bindValue(1, $username);
    $pre->bindValue(2, $password);
    $pre->bindValue(3, $salt);

    $pre->execute();

    return $pdo->lastInsertId();
}

$userId = register($username, $password);
if ($userId > 0) {
    echo '注册成功！用户ID为：' . $userId, PHP_EOL;
}

// 注册成功！用户ID为：1

// 查询数据库中的数据
$sth = $pdo->prepare("SELECT * FROM zyblog_test_user");
$sth->execute();

$result = $sth->fetchAll(PDO::FETCH_ASSOC);
print_r($result);

// Array
// (
//     [0] => Array
//         (
//             [id] => 1
//             [username] => ZyBlog1
//             [password] => bbff8283d0f90625015256b742b0e694
//             [salt] => xOkb
//         )

// )

// 登录时验证
function login($username, $password)
{
    global $pdo;
    // 先根据用户名查表
    $pre = $pdo->prepare("SELECT * FROM zyblog_test_user WHERE username = :username");
    $pre->bindParam(':username', $username);
    $pre->execute();
    $result = $pre->fetch(PDO::FETCH_ASSOC);

    // 用户名存在并获得用户信息后
    if ($result) {
        // 根据用户表中的salt字段生成hash密码
        $password = generateHashPassword($password, $result['salt']);

        // 比对hash密码确认登录是否成功
        if ($password == $result['password']) {
            return true;
        }
    }
    return false;
}

$isLogin = login($username, $password);
if ($isLogin) {
    echo '登录成功！', PHP_EOL;
} else {
    echo '登录失败，用户名或密码错误！', PHP_EOL;
}

// 登录成功！

// 测试表
/*
CREATE TABLE `zyblog_test_user` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户名',
    `password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '密码',
    `salt` char(4) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '盐',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
*/
```
PHP的password_hash()使用实例
https://www.jb51.net/article/48180.htm

> 虽然通过password_hash()创建的哈希密码更加安全，但是却降低了互操作性。
如我们使用md5方式，在php中用标准的MD5加密，很容易通过其他语言来校验，如node.js：
代码如下：

```
var hash = crypto.createHash('md5').update("123456").digest('hex');
if(hash == "e10adc3949ba59abbe56e057f20f883e")  console.log('密码正确');
```

而使用password_hash()加密的哈希值基本只能通过PHP的password_verify来校验。


------------


# 已知问题
## 登录页面
- firefox电脑端测试时发现手机模拟弹出框关闭后网页无法操作，只能刷新；
- Chrome电脑版手机模式下全屏后按Esc键，右下角的按钮不变化的问题。