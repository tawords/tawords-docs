> **密码禁止明文传输！** 加密方法见：开发文档 > 规范 > 注册、登录时密码使用的加密技术

> api基础路径为 `./api/v1/users`

<!-- ##################################  ################################## -->
### ● 用户登录

通过此接口实现用户登录功能。

> 更新日期：2021.02.27
> **info** 所有版本均支持此接口

**接口地址**：./api/v1/users/login.php
**请求方式**：POST

<details>
<summary>接口详细信息（点击展开）</summary>

| 参数名称     | 是否必须 | 类型   | 参数值示例   | 说明     |
| :---------- | :------: | :----- | :----- | :------- |
| username    |    是    | string | 111111 | 用户名 |
| password    |    是    | string | c97ee47294955604c0af78f83b3c735a | 密码（需要加密） |
| captcha     |    是    | string | 7438 | 用户输入的验证码 |
| login_token |    是    | string | 9f8f89ac0de94f7578e96dd9129bfc5a | 发回页面加载时生成的令牌 |

#### 请求示例：

```javascript
// jQuery
$.ajax({
    type: "POST", 
    url: 'api/v1/users/login.php',
    dataType: "json",
    data: {
        username: "",     // 用户名
        password: "",     // 密码
        captcha: "",      // 验证码
        login_token: "",  // 登录token
    },
    success: function (res) {
        if(res){
            if(res.success == true) {
                // 登录成功
            } else {
                // 登录失败
            }
        }
    },
    error:function (res) { 
        // POST失败时回调函数
    } 
});
```

**返回格式**：`json`

| 返回参数     | 类型   | 参数值示例   | 说明     |
| :---------- | :----- | :----- | :------- |
| flag        | string |  | 状态码 |
| message     | string | 这是一条消息 | 登录成功/失败时的提示消息 |
| success     | bool   | true | 用于判断用户是否登陆成功 |
| action      | array  | ["refresh_Page"] | 用于指示前端应该执行何种操作，例如清空文本框，刷新页面等等 |

#### 返回示例：

```javascript
{
    "flag":"状态码",
    "message":"登录成功/失败提示信息",
    "success":true,  // 用于指示是否登录成功
    "action":["前台事件1","前台事件2", ... ]
}
```
</details>

<!-- ##################################  ################################## -->

--------------------------------------------------------------------------------

### ● 获取用户登录状态

通过此接口获取用户登录是否登录。如果登陆成功，可以获得用户名和用户昵称。

> 更新日期：2021.02.27
> **info** 所有版本均支持此接口

**接口地址**：./api/v1/users/get-status.php
**请求方式**：GET

<details>
<summary>接口详细信息（点击展开）</summary>

#### 请求示例：

```javascript
// jQuery
$.getJSON("api/v1/users/get-status.php",function (res) {
    if(res['flag']){
        // 已经登录
    }else{
        // 没有登录
    }
});
```

**返回格式**：`json`

| 返回参数     | 类型   | 参数值示例   | 说明     |
| :---------- | :----- | :----- | :------- |
| username    | string | 111111 | 用户名（仅用户登录状态下返回） |
| nickname    | string | 用户昵称 | 用户昵称（仅用户登录状态下返回） |
| flag        | bool   | true | 是否登录 |

#### 返回示例：

```javascript
/* 已登录 */
{"username":"用户名","nickname":"用户昵称","flag":true}

/* 未登录 */
{"flag":false}
```
</details>

<!-- ##################################  ################################## -->

--------------------------------------------------------------------------------

### ● 退出登录

通过此接口让用户退出。

> 更新日期：2021.02.27
> **info** 所有版本均支持此接口

**接口地址**：./api/v1/users/logout.php
**请求方式**：GET

<details>
<summary>接口详细信息（点击展开）</summary>

#### 请求示例：

```javascript
// jQuery
$.getJSON("api/v1/users/logout.php",function (res) {
    if(res){
        // 退出登录成功，可以执行页面跳转
    }else{
        // 退出登录失败
    }
});
```

**返回格式**：`json`

#### 返回示例：

```javascript
{true}
```
</details>

