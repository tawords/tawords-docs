# 环境

## 服务器端环境要求

> 推荐环境：LNMP（Linux、Nginx、PHP、MySQL）

| 项目	 | 环境	 | 最低配置要求	 | 推荐配置要求	 | 说明	 |
| --- | --- | --- | --- | --- |
| 服务器系统	 | Linux（CentOS、Ubuntu等） / Windows Server and so on...	 | 	 | 	 | 建议使用Linux系列系统，不建议使用Windows Server 	 |
| Web Server	 | Nginx / Apache / IIS and so on...	 | 	 | 	 | 建议使用Nginx或Apache（首选Nginx）	 |
| 服务器端脚本语言	 | PHP	 | <!--5.2.0-->7.3	 | 7.4	 | GD库版本需要大于2.0.18	 |
| 数据库	 | MySQL	 | 5.0	 | 5.7	 | 	 |

<!--
参考：
- Web Server: IIS / Apache / nginx / Lighttpd / Kangle / Tengine / Caddy and so on...
- PHP 5.2 - 7.2 / HHVM 3 
- MySQL 5+ / MariaDB 10+ / SQLite 3
-->
------------

## PHP扩展

GD库（用户上传头像、网站登录、注册、找回密码、注销账号等时使用）


------------

## 客户端环境要求

### 浏览器

> 浏览器需要开启JavaScript，如果需要使用登录后相关功能还需要开启Cookie，**目前市面上绝大多数浏览器都满足此条件**。

#### 兼容性

不支持IE 10 以下版本的浏览器。


#### PC端(网页)
推荐使用`Chrome`浏览器，或者使用`Chrome内核`的浏览器（一般双核浏览器的极速模式为Chrome内核，比如`QQ浏览器`），也可使用`Firefox`浏览器。
**非常不推荐使用IE浏览器**，IE浏览器已经逐步被抛弃，我们不会为其做适配，经过测试，确认无法在IE10及以下浏览器中运行。

#### 移动端(网页)
目前仍在测试中，手机浏览器测试过QQ浏览器，Firefox浏览器，均可正常使用。如果您在使用过程中遇到问题，也可及时联系我们。