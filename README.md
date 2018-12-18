# LivAway Wechat Api

 

### 服务器 

linux centos7 `推荐`
window server 服务器


### 配置mysql数据连接 打开 `config/db.php`

```php
<?php
return [
    'class' => 'yii\db\Connection',
    'dsn' => 'mysql:host=127.0.0.1;dbname=livaway',
    'username' => 'root',
    'password' => （询问管理员）,
    'charset' => 'utf8',
];

```

## 服务器说明


服务器地址：ssh superadmin@47.96.231.54

若需要更高权限，登陆后再切到root ; su root 执行后面操作



 #### 环境配置：
所有项目需要软件安装包  ： /root/src/

nginx 安装目录：/www/server/nginx    

php 安装目录 /www/server/php

mysql 安装目录 /www/server/mysql



#### 项目目录：

`/www/wwwroot/WechatApi`

####更新项目：

登录至服务器进入目录
`cd /www/wwwroot/WechatApi`


git clone 拉取项目后，需要安装composer (PHP依赖)

 [点击查看composer安装说明](https://getcomposer.org/)

安装完毕后 在项目内先后执行(composer 执行目录已添加到PATH 中)

`composer install`

`composer update `

将程序所需的依赖库下载下来(时间比较慢，建议连接外网)


拉取最新代码 在项目目录下执行命令：
`git pull`   

 **注意：请勿直接拷贝代码到服务器，统一使用git部署**




# API文档
### 根据名字搜索成员

    请求方式:http-post/get
    请求接口:/kindness/transfer
    上行参数:
        keyword 搜索关键字
    下行参数:
    {
        code: 错误码（200 正确  400 错误）
        reason: 错误原因
        data: [
            'nickname' =昵称
            'username' =用户名
            'head_pic' =头像
            'id' = 用户 id
              ]
    }


### 转账界面

    请求方式:http-post/get
    请求接口:/kindness/search
    上行参数:
        id 用户 id
        self_id  自己id 
        
    下行参数:
    {
        code: 错误码（200 正确  400 错误）
        reason: 错误原因
        data: [
            'nickname' = 昵称
            'username' = 用户名
            'head_pic' = 头像
            'id' = 用户 id
            'is_set_pd' = 是否设置过密码（1 已设置，0 未设置）
            'self_amount' = 个人可用资产
              ]
        }
      
### 支付 KNP

    请求方式:http-post/get
    请求接口:/kindness/pay
    
    上行参数:
        user_id 用户 id
        self_id  自己 id
        psaaword 密码
        password_re 确认密码（可选）
        amount 变动knp资产
        note 留言
         
    下行参数:
    {
        code: 错误码（200 正确  400 错误）
        reason: 错误原因
        data: [
            'nickname' = 用户昵称
            'self_name' = 自己的昵称
            'head_pic' = 头像
            'note' = 留言信息
            'amount' = 转账金额
             ]
        }
      
        
