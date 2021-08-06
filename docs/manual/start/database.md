> 数据表前缀默认为`bdc_`

- 在线数据库关系图设计工具：https://dbdiagram.io/


<!--
# v1.
【附件】
> 更新时间：2021.04.08
> 上次更新时间：2021.01.02
<details>
<summary>点击展开</summary>
</details>
-->

# v1.5
> 更新时间：2021.04.10


<details>
<summary>点击展开</summary>

```sql
-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (

-- 用户基本信息
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户 id',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名（可以修改，但唯一）',
  `uuid` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '注册时生成，全局唯一不可改',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码（暂时，因为后期加密方式可能会升级）',
  `encryptedpwd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码（MD5加盐后Bcypt加密）',
  `safety_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '安全密码',
  `encryptedsafety_pwd` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '密码（MD5加盐后Bcypt加密）',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户状态(0正常 1禁用 2审核中 3审核拒绝 4审核忽略)',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '性别(0未填写 1男 2女)',
  `education` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号',
  `mail` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '邮箱',

-- 用户社交信息 及 统计
  `nickname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '头像地址',
  `avatar_at` datetime DEFAULT NULL COMMENT '头像修改时间',
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '个性签名',
  `signature_at` datetime DEFAULT NULL COMMENT '个性签名更新时间',
  `thread_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '主题数',
  `follow_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关注数',
  `fans_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '粉丝数',
  `liked_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞数',

-- 虚拟资产
  `virtual_currency` DECIMAL(10,0) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'β币',

-- 付费信息
  `joined_at` datetime DEFAULT NULL COMMENT '付费时间',
  `expired_at` datetime DEFAULT NULL COMMENT '付费到期时间',

-- 实名认证
  `identity` char(18) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '身份证号码',
  `realname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '身份证姓名',

-- 登陆相关
  `last_login_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '最后登录 ip',
  `login_at` datetime DEFAULT NULL COMMENT '最后登录时间',
  `login_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',

-- 注册相关，暂时用不到，但是保留，后续找回密码可能用得到
  `register_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注册ip',
  `created_at` datetime NOT NULL COMMENT '注册时间',
  `register_reason` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '注册原因',

-- 账户修改相关
  `username_bout` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户名修改次数',

-- 协议相关
  `accept_policy_version` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户接受的相关协议版本号，相关协议更新后可通知到用户',

-- 用户独立表相关（这个待定）
  `db_file` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户学习记录SQLite数据库文件名',
  `db_version` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'SQLite数据库内用户数据版本，记录版本便于后期分批升级用户数据',

-- 设置表的索引

-- 设置主键
  PRIMARY KEY (`id`),

-- 设置唯一
  UNIQUE KEY `users_uuid_unique` (`uuid`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- 表的结构 `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '附件 id',
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'uuid',
  `user_id` bigint(20) UNSIGNED NOT NULL COMMENT '用户 id',
  `type` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT '附件类型(0未知，1图片，2视频，3音频，4其他附件)',
  `is_remote` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否远程附件',
  `is_approved` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否合法',
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件系统生成的名称',
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件原名称',
  `file_size` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `file_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件类型',
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'ip 地址',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',

-- 设置主键
  PRIMARY KEY (`id`),

-- 设置唯一
  UNIQUE KEY `attachments_attachment_unique` (`attachment`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='附件';

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- 表的结构 `settings`
--

CREATE TABLE `settings` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '设置项 key（设置项的名称）',
  `value` text COLLATE utf8mb4_unicode_ci COMMENT '设置项 value（设置项的值）',
  `tag` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default' COMMENT '设置项 tag（设置项所在分类）',

-- 设置主键
  PRIMARY KEY (`key`,`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='网站设置';

--
-- 转存表中的数据 `settings`
--

INSERT INTO `settings` (`key`, `value`, `tag`) VALUES
  ('favicon', 'favicon.png', 'default'),
  ('title','在线背单词（开发中）','site'),
  ('captcha_font', '/static/font/geneva.ttf', 'font');
COMMIT;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- 表的结构 `words`
--

CREATE TABLE `words` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '单词 id',
  `words` varchar(255) NOT NULL DEFAULT '' COMMENT '英语单词（词组）',
  `word_type` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型(0未知，1单词，2词组)',
  `pho` text NOT NULL COMMENT '音标 phonetic-transcription',
  `trans` longtext NOT NULL COMMENT '中文',
  `search_count` int(11) NOT NULL DEFAULT 0 COMMENT '查询统计',
  `look_count` int(11) NOT NULL DEFAULT 0 COMMENT '浏览统计',
  `favi_count` int(11) NOT NULL DEFAULT 0 COMMENT '收藏统计',
  `star_count` int(11) NOT NULL DEFAULT 0 COMMENT '星标统计',
  `mark_count` int(11) NOT NULL DEFAULT 0 COMMENT '书签统计',

-- 设置主键
  PRIMARY KEY (`id`,`words`),

-- 设置唯一
  UNIQUE(`words`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='单词表';

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- 表的结构 `wordbooks`
--

CREATE TABLE `wordbooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '词书 id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '词书名称（用于显示给用户）',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT '词书别名（用于url访问及数据库查询）',
  `intro` text NOT NULL COMMENT '词书简介',

  `type` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型(0用户上传词书，1公共词书)',
  `permission` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '权限(0私密，1公开，2审核中)',
  `recommend` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '类型(0不推荐，1推荐)',

  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime DEFAULT NULL COMMENT '更新时间',

  `search_count` int(11) NOT NULL DEFAULT 0 COMMENT '查询统计',
  `look_count` int(11) NOT NULL DEFAULT 0 COMMENT '浏览统计',
  `favi_count` int(11) NOT NULL DEFAULT 0 COMMENT '收藏统计',
  `star_count` int(11) NOT NULL DEFAULT 0 COMMENT '星标统计',
  `mark_count` int(11) NOT NULL DEFAULT 0 COMMENT '书签统计',

-- 设置主键
  PRIMARY KEY (`id`,`alias`),

-- 设置唯一
  UNIQUE(`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='词书表';

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- 表的结构 `word_ref_wordbook`
--

CREATE TABLE `word_ref_wordbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `word_id` int(11) NOT NULL COMMENT 'id',
  `wordbook_id` int(11) NOT NULL COMMENT 'id',

-- 设置主键
  PRIMARY KEY (`id`,`word_id`,`wordbook_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='单词、词书关联表';

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- 表的结构 `word_supplements` （用于保存用户提交的数据库中不存在或者有错误的单词）
--

CREATE TABLE `word_supplements` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工单 id',
  `word_id` int(11) NOT NULL COMMENT '单词 id',
  `uuid` varchar(100) NOT NULL COMMENT '用户 uuid',
  `type` smallint(5) UNSIGNED NOT NULL COMMENT '类型(0补充数据库中不存在的单词，1单词拼写错误，2单词释义错误、错字、乱码，3单词释义不全，4其他)',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间（时间戳）',
  `content` text NOT NULL COMMENT '用户提交内容',
  `status` smallint(5) UNSIGNED NOT NULL COMMENT '状态(0等待管理员回复，1被采纳，2被拒绝，3未被采纳但是有一定用处)',

-- 设置主键
  PRIMARY KEY (`id`,`word_id`,`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='错误单词反馈记录表';

-- --------------------------------------------------------

-- --------------------------------------------------------

ALTER TABLE `attachments` ADD FOREIGN KEY (`uuid`) REFERENCES `users` (`uuid`);

ALTER TABLE `word_supplements` ADD FOREIGN KEY (`word_id`) REFERENCES `words` (`id`);

ALTER TABLE `word_supplements` ADD FOREIGN KEY (`uuid`) REFERENCES `users` (`uuid`);

ALTER TABLE `word_ref_wordbook` ADD FOREIGN KEY (`word_id`) REFERENCES `words` (`id`);

ALTER TABLE `word_ref_wordbook` ADD FOREIGN KEY (`wordbook_id`) REFERENCES `wordbooks` (`id`);



--
-- 删除表
--
DROP TABLE `word_supplements`;
DROP TABLE `wordbooks`;
DROP TABLE `words`;
DROP TABLE `settings`;
DROP TABLE `attachments`;
DROP TABLE `users`;
```

</details>


----------


# v1.3

> 更新时间：2021.01.22

[【附件】v1.3.sql](https://docs.only4.work/media/attachment/2021/01/v1.3.sql)