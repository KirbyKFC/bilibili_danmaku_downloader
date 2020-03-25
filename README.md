## 说明
网上找到的下载弹幕文件的浏览器脚本大多需要进入播放页面才能下载，若视频要求大会员但没有大会员账号则无法下载。为了较方便地下载大会员视频ass弹幕，我参考一些大佬在网上分享的B站API抽空写了个bash脚本。

## 脚本文件
### 依赖
1. 标准的Bash环境，带有curl、grep、sed等工具。
2. 将xml弹幕转换成ass字幕的工具，本脚本使用[danmaku2ass](https://github.com/m13253/danmaku2ass "danmaku2ass")

### 下载
保存[bash脚本文件](https://github.com/KirbyKFC/bilibili_danmaku_downloader/raw/master/bilibili_danmaku_downloader.sh "bash脚本文件")  
或者通过Github的"Clone or Download"

### 使用方法
#### 使用前
编辑bilibili_danmaku_downloader.sh文件，按需修改前几行的参数。

#### 下载单个视频的弹幕  
bilibili_danmaku_downloader.sh \[含有BV号的链接或BV号\]
例：   
1. ./bilibili_danmaku_downloader.sh https://www.bilibili.com/video/BV1As411i7rr 
2. ./bilibili_danmaku_downloader.sh BV1As411i7rr  

#### 下载多个视频的弹幕  
不带参数执行本脚本，按照提示依次输入链接或BV号。

## 杂谈
### 离线播放视频对比B站在线观看
优点：  
1. 字幕组源无删减和谐、BD源高画质。
2. 可使用更强的渲染器、各种滤镜、倍帧工具进一步提高画质（mpv、madVR、svp等等软件）

缺点：  
1. 新番更新比B站慢一两天。
2. 传统视频播放器如果不使用倍帧工具，则弹幕会按照视频帧率进行渲染，即辣眼睛的30帧或更低。（如果使用弹弹play则不会有这个问题，但会牺牲扩展性）

### 个人使用组合
播放器为mpv，  
使用KrigBilateral和[Anime4K](https://github.com/bloc97/Anime4K "Anime4K")算法，  
通过Vapoursynth挂载SVP4，  
最终输出4K分辨率60帧。
