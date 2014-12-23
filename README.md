redis-cluster
=============

缓存系统redis集群配置

reids集群采用双master互为slave的方式。每台linux服务器运行4个redis实例，由2个实例担任reids master角色，另2个实例担任reids slave。失效检测和切换由redis完成。


下载redis3.0以上版本
解压到/home/redis-cluster目录

编译安装
make && make install
