#!/bin/bash

for ((i=0;i<${tomcat_cluster_node_count};i++)); do
    node_port=${redis_cluster_port}${i}
    cd ${redis_cluster_base}/${node_port}
    su - ${redis_cluster_user} -c ${redis_cluster_work_base}/src/redis-server redis-node.conf
    
done
ps -ef |grep redis


