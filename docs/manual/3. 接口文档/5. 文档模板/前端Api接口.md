<!-- ################## 模板 开始 ################## -->
#### 【XXX】

这里填写接口简介。

> 更新日期：2021.XX.XX
> _**i**_ 支持v1.0.X及以上版本，低版本需做兼容处理。
> 或
> **** 所有版本均支持此接口

> 使用此接口前，须先进行用户登录
> 或
> 此接口无需用户登录

**接口地址**：./api/v1/user/insert
**请求方式**：POST / GET

<details>
<summary>接口详细信息（点击展开）</summary>


| 参数名称     | 是否必须 | 类型   | 参数值示例   | 说明     |
| :---------- | :------: | :----- | :----- | :------- |
| name        |    是    | string | 张三 | 姓名     |
| age         |    是    | int    | 18 | 年龄     |
| city        |    是    | string | 湖北省武汉市 | 城市     |
| address     |    是    | string | 湖北省武汉市武昌区友谊大道368号 | 详细地址 |
| email       |    是    | string | xxx@xx.com | 邮箱地址 |
| phone       |    是    | string | 18900000000 | 手机号码 |
| weixin      |    是    | string | xxxxxxx | 微信号码 |
| qq          |    是    | string | 1234567890 | qq号码   |
| weibo       |    是    | string | https://www.weibo.com/xxxxxx | 微博地址 |
| description |    是    | string | 此人很懒，没有填写简介 | 个人简介 |
| description |    否    | string | 此人很懒，没有填写简介 | 非必须时，可以在这里说明默认值 |


| 参数名称      | 是否必须 | 值   | 说明     |
| :----------- | :------: | :----- | :------- |
| Content-Type |    是    | application/json |      |
| Content-Type |    是    | application/x-www-form-urlencoded |      |

#### 请求示例：

```javascript
xxxxxx
```

**返回格式**：`json`

| 返回参数     | 类型   | 参数值示例   | 说明     |
| :---------- | :----- | :----- | :------- |
| status      | string | 0 | 状态码，0表示正常，-1表示错 |
| msg         | string | 这是一条消息 | 返回的消息 |
| data        | string | 这是一个data | 本次新增的用户编号，用于新增其他信息的userid参数 |

#### 返回示例：

```javascript
/* 成功 */
{
  status:0,
  msg:"用户新增成功",
  data:1
}

/* 失败 */
{
  status:1,
  msg:"用户新增失败"
}
```

</details>

<!-- ################## 模板 结束 ################## -->