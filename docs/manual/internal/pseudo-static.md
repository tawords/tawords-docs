> 使用宝塔配置

## 配置文件

删除 `|LICENSE|README.md` ：

```nginx
#禁止访问的文件或目录
# location ~ ^/(\.user.ini|\.htaccess|\.git|\.svn|\.project|LICENSE|README.md) # 修改这一行
location ~ ^/(\.user.ini|\.htaccess|\.git|\.svn|\.project)                     # 为这一行
{
  return 404;
}
```



## 伪静态

> 2021.08.18更新

http跳转https；www跳转@；访问二级域名指向网站的二级路径

```nginx
# http跳转https
if ($server_port !~ 443){
  rewrite ^(/.*)$ https://$host$1 permanent;
}

# 👇www跳转@
if ($host ~* "^www\.(.*?\..*?)$") # if ($host = 'www.reciteword.com')
{
  # $host = www.reciteword.com
  # $1 = reciteword.com
  return 301 https://$1; # https://reciteword.com$request_uri;
}

location ~ {
  index index.php index.html index.htm;
 
  # 👇访问二级域名指向网站的二级路径
  # 定义一个变量，用于保存正则表达式的匹配值（Nginx不允许嵌套if）
  set $param "";
  if ($http_host ~* "^(.*?)\..*?\..*?$") # if ($http_host ~* "^(.*?)\.reciteword\.com$")
  {
    set $param $1; # $param 是正则表达式的匹配值
  }
  # 定义默认指向二级路径（需要考虑首页）
  set $domain "@";
  if ($param != "") # 非首页
  {
    set $domain $param; # 指向网站的二级路径
  }
  # 到目前为止，已经完成获取 xx.reciteword.com 的 xx 信息了（如果是 reciteword.com 则为@）

  # 接下来是设置网站的 root（需要考虑文档 docs 是独立的目录）
  if ($domain != "docs")
  {
    root /www/wwwroot/tawords-server-side/$domain;
  }
  if ($domain = "docs")
  {
    root /www/wwwroot/tawords-docs/docs; # docs 为仓库 docs/ 文件夹
  }
}
# autoindex on; # 自动索引（测试时使用，线上环境勿开）
```

