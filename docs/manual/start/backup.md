## 网站备份

**在您要对网站升级时，请务必先对网站数据进行备份。**

网站备份分为两个步骤，即**网站文件备份**和**数据库备份**，二者缺一不可，而且建议尽可能在同一时间备份（即二者备份之间的时间差不要太大，尽可能减小在备份期间用户操作导致的网站文件和数据库不完全同步）。

> 建议在半夜用户活跃度低的时候进行备份操作，以免加大服务器压力。如果有条件的话，可以暂时关闭站点进行备份。

### 网站文件备份

在服务器端，将网站所在文件夹打包压缩，检查压缩包是否完好（即是否可以正常解压，解压出来的文件数量及大小是否与压缩前相等），然后将压缩包存档。
> 特别是`.tar.gz`格式的压缩包一定要检查是否完整，这类压缩包如果在压缩中出现错误而中断，压缩包是可以查看的，但是文件会不完整。相比之下，`.zip`格式的压缩包一般来说可以正常打开基本上就是完整的。
> 对于备份网站代码部分来说，`.tar.gz`格式会比`.zip格式`压缩包明显小不少，但是压缩时间会略长。如果网站附件、图片比较多的话，还是建议用`.zip格式`压缩，反之建议用`.tar.gz格式`压缩。

### 数据库备份

您可以通过MySQL管理工具（如网页版的phpMyAdmin，桌面版的Navicat等等软件），或者使用MySQL命令行进行备份。

> **使用宝塔的用户，千万不要为了贪图一时方便使用数据库一键备份**，宝塔一键备份在某种情况下会出现丢失部分数据，或者部分特殊字符变乱码等情况。同时，也**不要使用宝塔面板中一键导入数据库功能**。这些功能虽然操作起来方便，但是根据我们实际测试，数据库中的部分特殊字符以及表情符号等，会变成乱码。（测试版本为`宝塔Linux面板7.4.7`）