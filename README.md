# iGo电商项目

## 项目简介
该项目是一个电商类项目，包括用户的登陆注册、购物车、商品浏览、已购买商品列表、商品详情、个人资料的修改等，管理员的登陆注册、商品管理、用户信息管理等，它是一个相对完整的项目。点击查看[项目运行效果](http://39.105.138.38:8080/iGo/)

## 功能介绍
 - 用户：登陆注册、购物车、已购买的商品、查看商品列表、个人信息查看和修改、评价已购买的商品
 - 管理员：登陆注册、查看和删除用户信息、修改和查看商品数量、删除某个商品
 - 高级搜索：通过搜寻关键字，可以对商品列表进行筛选
 - 新增分页功能，逻辑很强

### 运用的知识
- 使用MySQL数据库、JDBC连接、分页
- java Web三层框架
- 将servlet的转发、重定向及方法进行封装，这样当设计到多个功能时不用建立多个servlet类
- 前端使用jsp、EL表达式获取数据
- session和cookie保存密码
- java 反射

### 搭建环境
eclipse + MySQL

## 项目效果截图

### 首页：
<img src="http://39.105.138.38:8080/iGo/function/index.png" width="90%" height="90%">

### 购物车：
<img src="http://39.105.138.38:8080/iGo/function/mycart.png" width="90%" height="90%">

### 商品列表：
<img src="http://39.105.138.38:8080/iGo/function/goodlist.png" width="90%" height="90%">

### 登陆：
<img src="http://39.105.138.38:8080/iGo/function/login.png" width="90%" height="90%">

### 已购买商品列表：
<img src="http://39.105.138.38:8080/iGo/function/paygood.png" width="90%" height="90%">
