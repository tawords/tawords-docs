## 注册、登录时密码使用的加密技术

### 登录

> 使用`密码加盐`生成不可逆哈希，**他人无法获取密码原文**。
```javascript
md5.hex(pwd + md5.hex(pwd));
```

### 注册
> 使用密码倒序`Base64`加密，再倒序`Base64`加密，避免密码在网上裸奔。
```javascript
Base64.encode(Base64.encode(pwd.split('').reverse().join('')).split('').reverse().join(''));
```

网站使用`SSL证书`（即网址前面的https），数据传输`非对称加密`（即使用“公钥”加密，“私钥”解密，公钥大家都知道，私钥仅服务器知道），确保中间人无法获得您的密码。