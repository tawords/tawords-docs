http://jz6.cn/post/23

# uniqid()
`uniqid()` 生成不重复唯一标识
```
md5(uniqid(md5(microtime(true)),true))
```
# session_create_id()
使用`session_create_id()`函数生成唯一标识符，经过实际测试发现，即使循环调用`session_create_id()`一亿次，都没有出现过重复。
`session_create_id()`是php 7.1新增的函数，用来生成session id，低版本无法使用。