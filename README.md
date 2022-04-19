PIKAPIKA - 漫画客户端
===================
[![license](https://img.shields.io/github/license/niuhuan/pikapika)](https://raw.githubusercontent.com/niuhuan/pikapika/master/LICENSE) 
[![releases](https://img.shields.io/github/v/release/niuhuan/pikapika)](https://github.com/niuhuan/pikapika/releases) 
[![downloads](https://img.shields.io/github/downloads/niuhuan/pikapika/total)](https://github.com/niuhuan/pikapika/releases) 

- 美观易用且无广告的漫画客户端, 能运行在Windows/MacOS/Linux/Android/IOS中。
- 本仓库仅作为学习交流使用, 请您遵守当地法律法规以及开源协议。
- 您的star和issue是对开发者的莫大鼓励, 可以源仓库下载最新的源码/安装包, 表示支持/提出建议。
- 源仓库地址 [https://github.com/niuhuan/pikapika](https://github.com/niuhuan/pikapika)

## 界面 / 功能

![阅读器](images/reader.png)

### 分流

VPN->代理->分流, 这三个功能如果同时设置, 您会在您手机的VPN上访问代理, 使用代理请求分流服务器。

### 漫画分类/搜索

![分类](images/categories_screen.png) ![列表](images/comic_list.png)

### 漫画阅读/下载/导入/导出

您可以在除IOS外导出任意已经完成的下载到zip, 从另外一台设备导入。 导出的zip解压后可以直接使用其中的HTML进行阅读

![导出下载](images/exporting.png)

![HTML预览](images/exporting2.png)

### 游戏

![games](images/games.png)
![game](images/game.png)

## 特性

- [x] 用户
    - [x] 登录 / 注册 / 获取个人信息 / 自动打卡
    - [x] 修改密码 / 修改签名 / 修改头像
- [x] 漫画
    - [x] 分类 / 搜索 / 随机本子 / 看此本子的也在看 / 排行榜
    - [x] 在分类中搜索 / 按 "分类 / 标签 / 创建人 / 汉化组" 检索
    - [x] 漫画详情 / 章节 / 看图 / 将图片保存到相册
    - [x] 收藏 / 喜欢
    - [x] 获取评论 / 评论 / 评论回复 (社区评论后无法删除, 请谨慎使用)
- [x] 游戏
    - [x] 列表 / 详情 / 无广告下载
- [x] 下载
    - [x] 导入导出 / 无线共享 / 移动设备与PC设备传输
- [ ] 聊天室
- [x] 缓存 / 清理
- [x] 设备支持
    - [x] 安卓
        - [x] 高刷新频率屏幕适配 (90/120/144... Hz)
        - [x] 安卓10以上随系统进入深色/夜间模式

## 其他说明

数据资料存储位置
- ios/android : 程序自身数据目录中, 删除就会清理
- windows : 程序同一目录中data文件夹下
- macos : ~/Library/Application\ Support/pikapika
- linux : ~/.pikapika

## 技术架构

### 多平台适配

这个应用程序使用golang和dart(flutter)作为主要语言, 可以兼容Windows, linux, MacOS, Android, IOS

使用了不同的框架桥接到桌面和移动平台上

- go-flutter => Windows / MacOS / Linux
- gomobile => Android / IOS

![平台](images/platforms.png)

### 构建环境

- [golang](https://golang.org/) (1.16)
- [flutter](https://flutter.dev/) (2.10.3)

## 请您遵守使用规则

本软件或本软件的拓展, 个人或企业不可用于商业用途, 不可上架任何商店

拓展包括但是不限于以下内容

- 使用本软件进行继续开发形成的软件。
- 引入本软件部分内容为依赖/参考本软件/使用本软件内代码的同时, 包含本软件内一致内容或功能的软件。
- 直接对本软件进行打包发布

软件副本分发规则

- 不要在任何其他 **二次元软件** 的 **聊天社区** 或 **开发社区** 内, 发布有关本软件的链接或信息
- 尽可能 **不要** 发送本软件安装包到任何社区内, 即尽可能不要将APK/IPA/ZIP/DMG发送包括任何聊天软件内的群聊功能中
- 分享本软件时, 尽可能粘贴github中releases页面的链接
- 若您有意直接分享本软件的分发副本, 应使用私聊窗口发送
