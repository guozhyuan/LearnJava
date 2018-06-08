##### 1.安装
- apt install mysql-server
- systemctl start mysql

##### 2.开启远程访问权限
- mysql -u root -p 
- grant all privileges on *.* to 'root'@'%' identified by 'root' with grant option;  
  flush privileges; 
  // 任意主机上都可以用账号root密码root登录
- /etc/mysql/mysql.conf.d/mysqld.cnf 中注释127.0.0.1
