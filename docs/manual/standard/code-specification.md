## 命名规则

?> 当前规范订立日期：2021年8月17日

为避免重复及便于识别，应用名中不能出现特殊字符，应用识别名须遵循相应书写规范。不得使用拼音作为命名方式。


### 文件名称规范

项目所有目录及文件名全部采用小写+下划线 `_` 形式（类文件名除外），例如 `system_basic.php`，不得出现大写字母。

类的文件名以 `类名.class.php` 为后缀。（一个.class.php文件只能包含一个类的定义）

配置文件的文件名以 `文件名.inc.php` 为后缀。（inc即为include file）

### 类命名规范

单词首大写，其余字母小写，如 `Tawords`，`UserAccount`。

类名不宜超过三个字母。

### 函数、方法命名规范

> 函数与方法的区别：函数是单独存在的，方法是依赖于类存在的。

全部使用小写，使用下划线`_`连接。如：`get_user_info`

### 变量命名规范

1. 变量首字母小写，采用驼峰式命名法（Camel-Case），即“**小驼峰**”。
2. 除非特殊情况，一般**不使用下划线**。
3. 不要使用容易产生混淆的命名（如 `$data1`，`$data2` ）
4. **数组变量**名后带 `Array` ，如 `$userInfoArray = array();`
5. **全局变量**前带 `g` ，以明确变量作用域，如 `$gUser`（全局变量 `$bta` 除外）
6. **静态变量**后带 `Static` 或前带 `s` ，如 `$sUrl`，`$fileArrayStatic`
7. **对象变量**后带 `Object` ，如 `$databaseObject`

如：`$userName`，`$delUserSql`

> 另外，全局变量为：$bta

### 常量命名规范

使用英文名词、动词，所有字母均大写，单词间使用下划线 `_` 分隔。

如：`define( 'A_GLOBAL_CONSTANT', "Heool world!" );`

### 数据库表名命名规范

所有字母均小写，使用下划线 `_` 连接，表名前需添加统一前缀（默认为 `bta_` ），如：`bta_users`



## 代码规范与编码风格

?> 当前规范订立日期：2021年8月17日

1. 对于只含有php代码的文件，在文件结尾处忽略掉 "?>" 。这是为了防止多余的空格或者其它字符影响到代码。

2. 缩进应该能够反映出代码的逻辑结果，尽量使用四个空格，不要使用制表符TAB，因为这样能够保证有跨客户端编程器软件的灵活性。

3. 函数、方法名与参数列表小括号间，参数列表小括号与花括号之间使用空格隔开，如：

   ```php
   function get_user_info ($userId) {
       // code
   }
   ```

4. 当一个字符串是纯文本组成的时候（即不含有变量时），以单引号(') 作为定界符，如：`$name = 'tawords';`

5. 当用点号 `.` 连接各字符串的时候，字符串与点号间用一个空格隔开，且允许把它分割成多行以增强可读性。

6. 类中方法用 `private`， `protected` 或者 `public `表明其作用域。

7. 即使if语句可以不适用花括号的情况下，也建议带上花括号。



## 注释规范（待定）

?> 当前规范订立日期：2021年8月17日

> `@version`表示当前代码文件迭代版本
> `@since` 表示从该版本开始加入该类、接口、方法
> `@auther`表示当前代码作者
> `@modify`表示当前代码修改时间
> `@deprecated` 表示不建议使用该类/接口/方法
> `@exception` 标注Runtime异常
> `@throws` 标注非Runtime异常

普通代码文件头

```php
/**
 * 背Ta单词 tawords
 *
 * @version      1
 * @since        1.0.0
 * @auther       Coding Zhang
 * @modify       2021.08.17
 */
```

类

```php
/**
 * 背Ta单词 tawords
 *
 * 一句话简介
 *
 * @version      1
 * @since        1.0.0
 * @auther       Coding Zhang
 * @modify       2021.08.17
 */
```



主路由文件添加官网地址以及开源Git仓库地址

```php
/**
 * @website      tawords.com
 * @repository   https://gitee.com/tawords/tawords/
 */
```





类、接口

```php
/**
 * 〈一句话功能简述〉LogManager 类集中控制对日志读写的操作。
 * 〈功能详细描述〉全部为静态变量和静态方法，对外提供统一接口。分配对应日志类型的读写器，读取或写入符合条件的日志纪录。
 * @author [作者]张三，李四，王五
 * @version [版本号, YYYY-MM-DD]1.2, 2001-03-25
 * @see [相关类/方法]LogIteraotor
 * @see [相关类/方法]BasicLog
 * @since [产品/模块版本]CommonLog1.0
 */
```

函数、方法
```php
/**
 * 〈一句话功能简述〉
 * 〈功能详细描述〉
 * @param [参数1] [参数1说明]
 * @param [参数2] [参数2说明]
 * @return [返回类型说明]
 * @exception/throws [违例类型] [违例说明]
 * @see [类、类#方法、类#成员]
 * @deprecated
 */
```
```php
/** 
* @Purpose: 
* 执行一次查询 
* @Method Name: Query()
* 
* @Param: string $queryStr SQL查询字符串 
* @Param: string $username 用户名
* 
* @Author: Michael Lee
*
* @Return: mixed 查询返回值（结果集对象） 
*/ 
function($queryStr, $username)
```





> 本规范订立时，参考了以下文章：
>
> [PHP编码规范（命名规则）](http://www.splaybow.com/post/php-coding-guifan.html)
>
> [php中类文件名的命名的规则是什么](https://www.cnblogs.com/Renyi-Fan/p/9417604.html)
>
> [PHP程序员必知的文件名命名规范](https://www.szhulian.com/new/729.html)

