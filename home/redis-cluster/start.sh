#!/bin/bash

. ./conf/redis-cluster.conf

for ((i=0;i<${redis_cluster_node_count};i++)); do
    node_port=${redis_cluster_port}${i}
    su - ${redis_cluster_user} -c ${redis_cluster_work_base}/src/redis-server redis-node.conf
done
ps -ef |grep redis


