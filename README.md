# *Android Web App*

## 1.*Web server*

### 1.1开发环境

- [x] 服务器:windows 2008 32 bit

- [x] 开发语言：python+sql

- [x] 数据库：MySQL Server(5.0)

### 1.2服务器配置

#### 1.2.1安装python 2.7 32 bit

 	1.配置视频 https://pan.baidu.com/s/1jIhAwJG

​	2.相关安装包 

​		2.1 找到python的安装目录，将..\Python27\Scripts路径添加到**系统环境变量**

​		2.2在该项目目录下，打开命令行，输入 **pip install -r requirement.txt**

​		2.3 下载并安装相应的MySQL驱动程序 下载链接 https://pan.baidu.com/s/1c274WH6

#### 1.2.2 数据库配置

​	1.数据库安装（略）

​	2.将目录下的SQL文件导入数据库（hack）

​	3.分别将web目录、SafeWeb目录下的sqlDB目录下的config文件修改成自己的数据库地址、端口等

​	4.网站默认账户与密码: admin admin

#### 1.2.3 配置python服务端

​	1.安卓服务端配置

​		1.1在web的目录下，在命令行的状态下，输入“**python Cweb.py 81**” ，开始服务器的81端口。

​		1.2可选开启: 自动获取FQ二维码，并在主页显示，目前该网站已停止维护

​	2.Web服务器配置

​		1.3同样在WebSafe目录下，在命令行的状态下，输入“**python Pweb.py 8080**” 

​	3.Message服务器配置

​		1.4 在当前目录的config.py中修改您自己的key（个推api）	

```python
# encoding=utf-8
'''
此文件用来存储安卓推送配置
'''
APPID = ''
APPKEY = ''
MASTERSECRET = ''
CID=''
HOST = 'http://sdk.open.api.igexin.com/apiex.htm'
```

​		3.2在mWEB.py文件夹下修改自己的url地址,其格式："http://xxxxx:8080/xssindex"

​		3.1 在Message的目录下，在命令行中输入“**python mWEB.py 7777**”

## 2.*Android源码配置*

### 2.1 *Android*环境安装（略）

### 2.2 *Android*源代码修改

#### 2.2.1 修改推送配置

​	1.说明采用个推的SDK进行配置，详情请参见官方文档

​	2.关键配置:**在 app/build.gradle 文件中的 android.defaultConfig 下添加 	manifestPlaceholders ,配置个推相关的应用参数**

```
manifestPlaceholders = [
GETUI_APP_ID : "APP_ID",
GETUI_APP_KEY : "APP_KEY",
GETUI_APP_SECRET : "APP_SECRET"
]
```

​	3.在network包的类与MainActivity修改相应的url，改为安卓服务器的url与端口

### *3.功能说明*

#### 3.1 *Android*功能

​	1.弱口令检测:FTP、Mysql、Mssql

​	2.GET请求方式的反射型XSS

​	3.GET请求方式的SQL注入检测

​	4.XSS通知

​	5.FQ二维码（网站已挂）

#### 3.2 Web功能

​	1.弱口令等相关检测

​	2.查看扫描信息

​	3.简易XSS平台

#### 3.3 Message功能

​	1.接受XSS，并通知给APP

### 4.补充说明

​	1.没做规划，想到哪写到哪，代码有点乱

​	2.APP的相关内容边学边做，留了好几块硬伤

​	3.没规划，数据库做的不好

### 5.未来展望

​	1.完善弱口令机制，采取训练1***06的相关数据得到常用弱口令算法（已完成30%）

​	2.弱口令的连接方式，尝试手写socket实现

​	3.采取浏览器伪装(已完成70%)

​	4.增加post方式、头注入等多种方式进行检测

​	5.重构数据库（很重要）

​	6.增加代理池（已完成50%）寻找更多的代理资源

​	7.Android网络请求、服务深入

​	8.完善XSS平台（参考已有的案例）

​	9.增加域名检测、后台扫描、敏感信息、poc验证等功能

### 6.大佬们留个star再走吧！

​	联系方式 ​:e-mail:​:hlpureboy@gmail.com





