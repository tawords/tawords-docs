https://www.w3school.com.cn/html5/tag_map.asp
```html
<img src="planets.gif" alt="Planets" usemap ="#planetmap" />

<map name="planetmap">
 <area shape ="rect" coords ="0,0,110,260" href ="sun.htm" alt="Sun" />
 <area shape ="circle" coords ="129,161,10" href ="mercur.htm" alt="Mercury" />
 <area shape ="circle" coords ="180,139,14" href ="venus.htm" alt="Venus" />
</map>
```

http://www.divcss5.com/html5/h54844.shtml
```html
首先让我们来看一下htmlmap标签是什么：
 
　　htmlmap标签:定义一个客户端图像映射。图像映射（image-map）指带有可点击区域的一幅图像。
 
　　定义map：
 
　　<mapid="im_map" name="im_map">
 
　　<areashape="rect" coords="0,0,100,100"href="url.html"/>
 
　　</map>
 
　　map标签定义map，area标签定义可点击的热点，area属性;
 
　　shape：定义热点形状，可选参数rect(矩形)、circle(圆形)、poligon(自定义形状)。
 
　　coords：定义形状路径;
 
　　当shape=rect时，四个数字依次为：起点X、起点Y、终点X、终点Y
 
　　当shape=circle时，三个数字依次为：中心点X、中心点Y、半径
 
　　当shape=poligon时，可定义多个路径点，依次为：起点X、起点Y、路径1X、路径1Y、路径2X、路径2Y......
 
　　href定义点击跳转的地址。
 
　　htmlmap标签必需的属性：
 
　　id：unique_name：为map标签定义唯一的名称。
 
　　htmlmap标签可选的属性：
 
　　name：mapname：为image-map规定的名称。
 
　　map标签在HTML中的结构：
 
　　1、coords的对应坐标不用变，只需在JS里面改变其比例就OK！
 
　　<divclass="map_img">
 
　　<imgclass="mapImg" usemap="mapName"src="isphoto/abc.png"alt=""style="width:450px">
 
　　<mapname="mapName">
 
　　<!--方形区域写法-->
 
　　<!--<areashape="rect"coords="605,250,660,305"target="_blank"href="javascript:alert(1);"alt=""/>-->
 
　　<areashape="circle" coords="633,276,28"target="_blank"href="javascript:alert('汽车图标');"alt=""/>
 
　　</map>
 
　　</div>
 
　　2、如果有多张图片，一张图片对应一个map，class不用变，改变map的name值和对应的usemap值就好。name=usemap他们俩是一对CP哦，不要分开它们，给他们一样的值。
 
　　<divclass="map_img">
 
　　<imgclass="mapImg" usemap="mapName"src="isphoto/abc.png"alt=""style="width:450px">
 
　　<mapname="mapName">
 
　　<areashape="circle" coords="633,276,28"target="_blank"href="javascript:alert('汽车图标');"alt=""/>
 
　　</map>
 
　　<!--一张图片对应一个name和usemap-->
 
　　<imgclass="mapImg" usemap="mapName2"src="isphoto/abc.png"alt=""style="width:450px">
 
　　<mapname="mapName2">
 
　　<areashape="circle" coords="633,276,28"target="_blank"href="javascript:alert('第二张图的汽车图标');"alt=""/>
 
　　</map>
 
　　</div>
 
　　html<map>标签常用在为图像的某区域添加超链接！
 
　　用法如下：
 
　　<imgsrc="planets.gif" alt="无法显示此图像" usemap="#planetmap"/>
 
　　<mapid="planetmap" name="planetmap">
 
　　<areashape="rect" coords="0,0,82,126"href="sun.htm"alt="Sun"/>
 
　　<areashape="circle" coords="90,58,3"href="mercur.htm"alt="Mercury"/>
 
　　<areashape="circle"  coords="124,58,8"href="venus.htm"alt="Venus"/>
 
　　</map>
 
　　usemap属性获取<map>标签信息，<area>标签定义一个链接区域，shape属性定义区域形状，coords属性定义链接区域的起点坐标和终点坐标
 
　　注释：area元素永远嵌套在map元素内部。area元素可定义图像映射中的区域。
 
　　注释：<img>中的usemap属性可引用<map>中的id或name属性（取决于浏览器），所以我们应同时向<map>添加id和name属性。
```