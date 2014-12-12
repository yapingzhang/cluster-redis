#!/bin/bash

. ./conf/redis-cluster.conf

for ((i=0;i<${redis_cluster_node_count};i++)); do
    ${redis_cluster_work_base}/src/redis-server ${redis_cluster_base}/${redis_cluster_port}${i}/redis-node.conf
#    node_port=${redis_cluster_port}${i}
#    ${redis_cluster_base}/${node_port}/startup.sh
#    su - ${redis_cluster_user} -c ${redis_cluster_work_base}/src/redis-server ${redis_cluster_base}/${node_port}/redis-node.conf
#    su - ${redis_cluster_user} -c 'echo ${redis_cluster_work_base}/src/redis-server'
#    su - ${redis_cluster_user} -c 'echo ${redis_cluster_base}/${node_port}/redis-node.conf'
done
ps -ef |grep redis


