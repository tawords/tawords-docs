## 命名规范（待定）

为避免重复及便于识别，应用名中不能出现特殊字符，应用识别名须遵循驼峰式书写规范，只能包含`大小写字母`和下划线`_`，应用目录名为应用识别名，定义的所有函数需要以应用识别名加`_`作为前缀；
所有目录及文件名，全部小写，不得出现大写字母；



## 注释规范 Annotation specification（待定）

> `@since` 表示从那个版本开始就有这个类/接口/方法
> `@deprecated` 表示不建议使用该类/接口/方法
> `@exception` 标注Runtime异常
> `@throws` 标注非Runtime异常

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

方法
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