## 发布应用

> 在编写并测试好代码后，可以将应用上传至应用中心进行审核。审核通过后即可发布。
>
> 应用期将视应用中心实际情况适时开发上线。



以下是发布应用的流程。

### 1. 成为开发者

成为开发者的条件：①有开发者账号；②绑定手机号；③等待通过审核

首先，你需要注册一个开发者应用账号。

然后，在用户中心绑定您的手机号，并完善账户信息。

最后，点击提交审核按钮，等待审核通过。审核期间，您可以上传应用以及配置相关信息，也可同时提交应用审核，但只有审核通过后，你的应用才可以发布至应用中心。

> **请注意，账号一旦注册，用户名等账户重要信息暂时不可修改。所以注册账号时一定要想好。**

> 根据《互联网用户账号名称管理规定》等相关规定，您只有绑定手机号才可以进行后续操作。



### 2. 在后台创建一个应用

创建应用后，系统会为你生成一个**应用ID**（`plugId`）和**应用密钥**（`plugSecret`）。`plugSecret`将只显示一次，请保存好这两个密钥，如果您忘记了，则需要重置`plugSecret`

- `plugId`用于唯一标识应用。在用户下载应用，或者更新应用的时候会用到。该值由系统生成，无法修改。
- `plugSecret`的用处还没想好，但是是有用的【待更新】

> **请一定保管好plugSecret，不要泄露给任何人！如果已发生泄露，请立即重置plugSecret**



### 3. 上传你的应用

根据页面提示上传您的应用。

上传应用后，应用信息将默认使用`intro.json`文件中的信息。如需修改，可修改`intro.json`文件，然后重新上传。

> `intro.json`编写规范请[查看这里]()【待完善】



- 应用发布日期（与配置文件中`pubDate`保持一致，且不能填写还未到的日期，一旦首次审核通过，将不能更改）
- 选择你的应用风格
- 
- 上传应用缩略图
- 





### 4. 阅读并同意应用中心相关条款

在认真阅读并同意应用中心服务协议、隐私政策等条款内容后，勾选“我已阅读并同意上述条款”，然后点击下一步。



### 5. 提交审核

确认应用信息填写无误后，即可提交审核。

> 第一次审核通过日期显示为<u>应用发布日期</u>，开发者无法手动修改。

若审核未通过，您可以根据提示信息修改对应信息，并再次提交。

> 请注意，若审核未通过，请修改后再次提交。请不要不经修改反复提交。否则您的账号将可能受到相应处罚，甚至封号。



## 应用更新

主题更新时，你需要做以下几步：

上传新的主题包，填写更新说明，并提交审核

### 1.上传新的应用包

登录后台，选择账号中需要更新的应用，然后点击修改。



### 2. 填写更新说明

上传应用包后，填写版本更新说明。

如果需要修改应用的其他信息，也可在当前页一并更改，更改后提交即可。



### 3. 提交审核

点击提交审核按钮，等待审核结果。

