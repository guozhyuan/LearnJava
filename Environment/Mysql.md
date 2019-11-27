### 1.安装
- apt install mysql-server
- systemctl start mysql

### 2.开启远程访问权限
- mysql -u root -p 
- grant all privileges on *.* to 'root'@'%' identified by 'root' with grant option;  
  flush privileges; 
  // 任意主机上都可以用账号root密码root登录
- /etc/mysql/mysql.conf.d/mysqld.cnf 中注释127.0.0.1
### 3.mysql权限及作用域
用户权限:
- user表存储全局权限,意所有mysql中的数据库权限.表现形式: *.*
- db表存储数据库权限,意某个数据库的权限.      表现形式: \[db_name\].*
- tables_priv表存储表权限,意某个表的权限     表现形式:  \[db_name\].\[table_name\]
作用域:
- \[user_name\]@\[scope\]  例如: \[root\]@\[localhost\] , 允许localhost root用户

查看用户权限:
- show grants for 'root'@'localhot'
```
+---------------------------------------------------------------------+
| Grants for root@localhost                                           |
+---------------------------------------------------------------------+
| GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION |
| GRANT PROXY ON ''@'' TO 'root'@'localhost' WITH GRANT OPTION        |
+---------------------------------------------------------------------+
```

### 4.创建用户,授权
1.创建用户
```
create user '[user_name]'@'[scope]' identified by 'password';
flush privileges;
```
2.创建并授权
grant \[权限\] on \[db_name\].\[table_name\] to '\[user_name\]'@'\[scope\]' identified by '\[password\]'
> 权限为ALL PRIVILEGES或ALL是所有权限，还有单个权限select、update、insert、delete等，单个权限之间用逗号隔开，详细可以查看下mysql.user表的表结构。\[数据库名\].\[表名\]为*.*时表示所有数据库。
