# LivAway Wechat Api
### 环境说明：
Apache2.2+版本
myql5.5+版本
php5.5+版本
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
    'password' => 'vertrigo',
    'charset' => 'utf8',
];

```
