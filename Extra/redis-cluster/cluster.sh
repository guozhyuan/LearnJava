#!/bin/bash  
#redis集群快速启动与关闭脚本  
#条件一:当前文件夹下包括包含node开头的各个节点文件夹,节点文件夹下包含redis.conf配置文件,不可以配置成守护线程,不然启动时无法输出info到infoFile  
#条件二:当前文件夹下包括redis-server,redis-cli  
#条件三:请保持node文件夹后的数字与内部配置文件的端口号一致,例如node_7000文件夹的端口号为7000  
  
#当前位置  
cluster_dir=`ls`  
#node节点的个数  
node_size=0  
#node节点数组  
nodes=()  
#信息文件  
infoFile="infoFile"  
#pid文件  
pidFile="pidFile"  
#创建infoFile和pidFile文件  
touch infoFile  
touch pidFile  
  
#启动以node开头的文件夹下的redis节点,条件一:node开头,条件二:必须是文件夹  
function starCluster(){  
echo "" > $infoFile  
echo "========================端口号:======================="  
for node in $cluster_dir  
 do  
  if [ ${node:0:4} = "node" ]  
   then  
    if [ -d ${node} ]  
     then  
      node_size=`expr ${node_size} + 1`  
      echo -e "${node:5:8},\c"  
      redis-server ${node}/redis.conf >> $infoFile&   
    fi  
  fi  
done  
echo ""  
echo "======================================================"  
echo "===================有${node_size}个redis节点====================="  
echo "======================================================"  
}  
  
#关闭所有节点  
function stopCluster(){  
	ps -ef|grep redis|grep -v grep|awk '{print "kill -9 "$2}' | sh
	ps -ef|grep redis 
}  
  
case $1 in  
start) starCluster  
;;  
stop) stopCluster  
;;  
esac  



