> **密码禁止明文传输！** 加密方法见：开发文档 > 规范 > 注册、登录时密码使用的加密技术

> api基础路径为 `./api/v1/users`

<!-- ##################################  ################################## -->
### ● 修改昵称

通过此接口实现用户昵称修改功能。

> 更新日期：2021.02.27
> **info** 所有版本均支持此接口
> 使用此接口前，须先进行用户登录

**接口地址**：./api/v1/users/modify_user_nickname.php
**请求方式**：POST

<details>
<summary>接口详细信息（点击展开）</summary>

| 参数名称     | 是否必须 | 类型   | 参数值示例   | 说明     |
| :---------- | :------: | :----- | :----- | :------- |
| key         |    是    | string | ajax | 固定参数，填写`"ajax"` |
| nickname    |    是    | string | 111111 | 用户修改后的新用户名（放在URL参数中） |
| uuid        |    是    | string |  | 用户uuid |

#### 请求示例：

```javascript
// jQuery
$.ajax({
	type: "post",
	url: "./api/v1/users/modify_user_nickname.php?nickname=" + newNickname,
	data: {key: 'ajax', uuid: '用户uuid'},
	dataType: "json",
	success: function (res) {
		if(res){
			if(res.success == true)
				 /* 昵称修改成功 */
			else
				/* 昵称修改失败 */
		}
	},
	error:function (res) {
		// 请求失败回调函数
	}
});
```

**返回格式**：`json`

| 返回参数     | 类型   | 参数值示例   | 说明     |
| :---------- | :----- | :----- | :------- |
| msg         | string | 这是一条消息 | 修改成功/失败时的提示消息 |
| success     | bool   | true | 用于判断用户昵称是否修改成功 |

#### 返回示例：

```javascript
{"msg":"信息","success":true}
```
</details>

<!-- ##################################  ################################## -->

--------------------------------------------------------------------------------

### ● 修改密码

通过此接口实现用户密码修改功能。

> 更新日期：2021.02.27
> **info** 所有版本均支持此接口
> 使用此接口前，须先进行用户登录

**接口地址**：./api/v1/users/modify_user_nickname.php
**请求方式**：POST

<details>
<summary>接口详细信息（点击展开）</summary>

| 参数名称     | 是否必须 | 类型   | 参数值示例   | 说明     |
| :---------- | :------: | :----- | :----- | :------- |
| key         |    是    | string | ajax | 固定参数，填写`"ajax"` |
| uuid        |    是    | string |  | 用户uuid |
| oldPwd      |    是    | string |  | 旧密码（加密后） |
| newPwd      |    是    | string |  | 新密码（加密后） |
| newPwd_Confirm |    是    | string |  | 新密码确认（加密后） |

#### 请求示例：

```javascript
// jQuery
$.ajax({
    type: "post",
    url: "./api/v1/users/modify_user_password.php",
    data: {
        key: 'ajax',
        uuid: '用户uuid',
        oldPwd: Base64.encode(Base64.encode(oldPwd.split('').reverse().join('')).split('').reverse().join('')),
        newPwd: Base64.encode(Base64.encode(newPwd.split('').reverse().join('')).split('').reverse().join('')),
        newPwd_Confirm: Base64.encode(Base64.encode(newPwd_Confirm.split('').reverse().join('')).split('').reverse().join('')),
    },
    dataType: "json",
    success: function (res) {
        if(res){
            if(res.success == true)
                /* 密码修改成功 */
            else
                /* 密码修改失败 */
        }
    },
    error:function (res) {
        // 请求失败回调函数
    }
});
```

**返回格式**：`json`

| 返回参数     | 类型   | 参数值示例   | 说明     |
| :---------- | :----- | :----- | :------- |
| msg          | string | 这是一条消息 | 修改成功/失败时的提示消息 |
| success     | bool   | true | 用于判断用户密码是否修改成功 |

#### 返回示例：

```javascript
{"msg":"信息","success":true}
```
</details>