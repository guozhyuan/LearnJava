##### 1.安装
- apt install mysql-server
- systemctl start mysql

##### 2.开启远程访问权限
- mysql -u root -p 
- grant all privileges on *.* to 'root'@'%' identified by 'passwordd' 
  with grant option;
  flush privileges;
- /etc/mysql/mysql.conf.d/mysqld.cnf 中注释127.0.0.1
