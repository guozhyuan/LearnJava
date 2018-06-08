##### ROOT账号登录
1.安装SSH
```
apt install ssh
systemctl start ssh
```

2.修改配置文件
```
vim /etc/ssh/sshd_config
```
找到
```
# Authentication:
LoginGraceTime 120
PermitRootLogin prohibit-password
StrictModes yes
```
修改为
```
# Authentication:
LoginGraceTime 120
PermitRootLogin yes
StrictModes yes

```

```
systemctl restart ssh
```