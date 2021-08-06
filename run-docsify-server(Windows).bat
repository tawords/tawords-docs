::
:: 背Ta单词 BTadc
::
:: 该脚本仅在Windows下有效，且需要在npm安装docsify-cli工具之后才可使用
::
:: @version  1.0.0
:: @auther  Coding Zhang
:: @modify  2021.08.07
::

@echo off

:: 找到系统默认浏览器
for /f "tokens=3,4" %%a in ('"reg query HKEY_CLASSES_ROOT\http\shell\open\command"') do (set softWareRoot=%%a %%b)

::打开网页
start % SoftWareRoot % http://localhost:3000

:: 启动docsify服务
docsify serve docs