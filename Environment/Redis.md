##### Redis <ubuntu>
	1.apt install gcc
	  apt install g++
    	  apt install ruby
	  apt install rubygems
	  gem install redis
	2.下载redis redis-4.0.6.tar.gz,解压
  	3.cd redis-4.0.6	
    	  make
	  make install PREFIX=/usr/redis-cluster   //拷贝生成的文件到指定目录
  	5.redis-cluster : <参考extra/redis-cluster/node_700* cluster.sh create_cluster.sh>
	  注意:若redis设置了密码，需要在在client.rb中配置该密码.<find / -name client.br>
	      连接指定节点：redis-cli -p port; auth password;  	
