```sql
handlebars
官网：https://handlebarsjs.com/installation.html
可借鉴的（堆糖）：https://www.duitang.com/p/atlas/?id=117068767
查阅资料：https://www.jianshu.com/p/2ad73da601fc


<script type="text/x-handlebars-template" id="bottom-comment-tmpl">
<div class="bottom-comment-content">
<span>回复</span>
<textarea name="comment" id="operate-comment" cols="80" rows="2" placeholder="说些什么吧..."></textarea>
</div>
<div class="bottom-comment-button">
<div class="bottom-comment-photo">
<input id="choose-photo" type="file" accept="image/*" style="display:none"></input>
<a href="javascript:;" class="comment-add-photo"><i class="icon-photo"></i>添加图片</a>
<div class="comment-photo-wrap">
<img src="" alt="">
<a href="javascript:;" class="photo-edit">编辑</a>
<a href="javascript:;" class="photo-delete">删除</a>
</div>
</div>
<div class="bottom-comment-submit">
<a href="javascript:;" class="comment-cancel">取消</a>
<a href="javascript:;" class="comment-submit">发送</a>
</div>
</div>
</script>
```