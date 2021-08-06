## 文字版

> 最后修改日期：2021年3月23日
> 备注：文字版比图片版更详细

```html
 ├ about
 │ ├ credits		// 使用开源框架的开源协议
 │ │ ├ css		// CSS样式文件
 │ │ │ ├ text_defaults.css		// 
 │ │ ├ js		// JavaScript文件
 │ │ │ ├ cr.js		// 
 │ │ │ ├ credits.js		// 
 │ │ ├ index.htm		// 
 │ ├ feedback		// 用户反馈

 ├ admin
 │ ├ login.php		// 登录
 │ ├ index.php		// 管理员后台的主路由
 │ ├ install.php		// 网站安装脚本，安装之后会自动删除
 │ ├ update.php		// 网站升级脚本

 ├ api
 │ ├ v1		// 接口（第1版）
 │ │ ├ captcha		// 验证码
 │ │ ├ upload		// 用户上传文件
 │ │ │ ├ avatar		// 用户头像
 │ │ │ ├ wordbook		// 词书
 │ │ ├ users		// 用户账户
 │ │ │ │ ├ get-status.php		// 获取用户是否登录
 │ │ │ │ ├ login.php		// 用户登录
 │ │ │ │ ├ logout.php		// 用户注销
 │ │ │ │ ├ regist.php		// 用户注册
 │ │ │ ├ words		// 单词
 │ │ │ │ ├ get-random-words.php		// 随机单词

 ├ file		// 和用户有关的数据
 │ ├ avatar		// 用户头像
 │ │ ├ crop		// 头像
 │ │ ├ original		// 头像裁切前原图
 │ │ ├ thumbnail		// 头像缩略图
 │ ├ upload		// 用户上传的文件(按照`年-月`分文件夹存放）
 │ ├ wordbook		// 用户上传的词书

 ├ resources		// 
 │ ├ prompt		// 
 │ │ ├ check_javascript		// 检查浏览器是否支持JavaScript
 │ │ │ ├ check.php		// 
 │ │ │ ├ noscript.html		// 
 │ │ ├ 404.php		// 404页面
 │ ├ template		// 前端页面模板
 │ │ ├ ......		// 
 │ ├ views		// 
 │ │ ├ avatar-upload		// 头像上传前端页面

 ├ static		// 静态文件
 │ ├ css		// 前端CSS样式
 │ │ ├ universe.css		// 全局CSS样式
 │ ├ image		// 前端公用静态图片素材
 │ │ ├ ......
 │ ├ js		// JavaScript脚本
 │ │ ├ app.js		// 
 │ │ ├ ......		// 
 │ ├ vendor		// 前端使用的第三方库
 │ │ ├ jquery		// 
 │ │ │ ├ jquery-3.5.1.min.js		// jQuery 3.5.1
 │ │ ├ mdui		// 
 │ │ │ ├ ......		// 
 │ │ ├ ......		// 

 ├ system
 │ ├ function		// 网站核心函数（用户不可以直接访问该文件夹下页面）
 │ │ ├ api		// api后台实现
 │ │ ├ basic		// 网站基础函数
 │ │ │ ├ user.php		// 用户操作
 │ │ │ │ ├ ......		// 
 │ │ │ ├ token.php		// 令牌生成与失效
 │ │ │ │ ├ generate		// 生成页面token
 │ │ │ │ ├ destroy		// 销毁页面token
 │ │ │ ├ ......
 │ │ ├ database		// 数据库连接
 │ │ │ ├ mysql.php
 │ │ │ ├ sql.php
 │ │ │ ├ sqlite.php
 │ │ │ ├ ......
 │ │ ├ page		// 页面显示时可能会用的到的一些组件
 │ │ │ ├ components		// 组件（可供主题、插件调用）
 │ │ │ ├ partials		// 片段（可供主题、插件调用）
 │ │ │ ├ public		// 网站页面公共部分（导航栏、菜单、页脚等）
 │ │ │ ├ ......		// 网站各个功能页面
 │ │ ├ statistics		// 统计页面执行速度及使用内存
 │ │ │ ├ begin.php
 │ │ │ ├ end.php
 │ │ ├ ......
 │ ├ install		// 网站安装【安装后自动删除】
 │ │ ├ ..... .php
 │ ├ plugin		// 插件（还没启用）
 │ │ ├ pluginName1
 │ │ │ ├ settings.php
 │ │ │ │ ├ 待完善
 │ │ │ ├ .......
 │ │ ├ pluginName2
 │ │ │ ├ .......
 │ │ │ ├ .......
 │ ├ theme		// 主题（还没启用）
 │ │ ├ default
 │ │ │ ├ head.php		// 页面头部 <head></head>
 │ │ │ ├ navbar.php		// 头部导航栏
 │ │ │ ├ footer.php		// 页脚
 │ │ │ ├ frame.php		// 页面框架
 │ │ │ ├ .......
 │ ├ themeName1
 │ │ ├ .......
 │ │ ├ .......
 │ ├ themeName2
 │ │ ├ .......
 │ │ ├ .......
 │ ├ .......
 │ ├ config.php		// 网站配置文件
 
 ├ index.php		// 网站的主路由
 │ ├ privacy.html		// 网站隐私政策
```


## 图形版

> 最后修改日期：2021年3月23日，图片使用 <a href="https://www.processon.com/" target="_blank">Process On</a> 制作

<a href="https://www.processon.com/embed/604db2a3637689019dd8ca17" target="_blank">新标签页打开</a>

![](http://processon.com/chart_image/604db2a3637689019dd8ca1a.png?_=1615704904368)



<!--
 │ ├ upload		// 用户上传的文件，目前仅限制登录用户才可上传，且仅可上传txt文档。按照年月分文件夹存放，文件名格式（待定）


 ├ page		// 功能页面**（用户不可以直接访问该文件夹下页面）**
 │ ├ component		// 功能页面中使用到的组件
 │ │ ├ 【！】not-exists.php.bak		// 
 │ │ ├ notifications.php		// 首页消息提示组件
 │ │ ├ refresh-btn.php		// 首页刷新按钮
 │ │ ├ under-construction.php		// 该功能正在建设中 提示页面
 │ │ ├ words-block.php		// 单词展示框
 │ ├ .htaccess		// 
 │ ├ about.php		// 关于
 │ ├ bookmark.php		// 我的书签**还未开发**
 │ ├ favi-word.php		// 我的收藏**还未开发**
 │ ├ feedback.php		// 意见反馈 需要完善（目前是调用的网站的意见反馈）
 │ ├ home.php		// 主页
 │ ├ index.html（空文件）		// 
 │ ├ login.php		// 登录
 │ ├ my-wordbook.php		// 我的单词本**还未开发**
 │ ├ pub-wordbook.php		// 公共词书**还未开发**
 │ ├ random.php		// 随便学学
 │ ├ search.php		// 查单词**还未开发**
 │ ├ select-wordbook.php		// 选择背诵词书**还未开发**
 │ ├ settings.php		// 设置**还未开发**
 │ ├ star-word.php		// 我的星标**还未开发**
 │ ├ ucenter.php		// 个人中心**还未开发**
 │ ├ upload-wordbook.php		// 上传自定义词书**还未开发**

 ├ public		// 首页用到的一些组件**（用户不可以直接访问该文件夹下页面）**
 │ ├ .htaccess		// 
 │ ├ footer.php		// 
 │ ├ head.php		// 
 │ ├ index.html（空文件）		// 
 │ ├ menu.php		// 
 │ ├ navbar.php		// 
 │ ├ navbar-mobi.php		// 

 ├ test		// 测试用文件
 │ ├ 【略】		// 
 │ ├ SQLite
 │ ├ MySQL
 │ ├ union-login.bak
 │ ├ css
 │ ├ js
 │ ├ php

 ├ 根目录		// 
 │ ├ .htaccess		// 
 │ ├ config.php		// 网站相关配置
 │ ├ favicon.ico		// 网站图标
 │ ├ index.php		// 网站主页面
 │ ├ privacy.html		// 隐私条款**（后期转移到Licence文件夹下）**
 │ ├ 【！】（英语音标字体）Ksphonet.ttf		// 

-->
