```javascript
// 在新窗口中打开链接
$('body').on('click', '.markdown-body a', function (e) {
	e.preventDefault();
	window.open(this.href, '_blank');
});
```