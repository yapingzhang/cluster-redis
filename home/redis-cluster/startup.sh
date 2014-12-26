#!/bin/bash

redis_cluster_base=$(cd `dirname $0`; pwd)
. ${redis_cluster_base}/conf/redis-cluster.conf

for ((i=0;i<${redis_cluster_node_count};i++)); do
    ${redis_cluster_work_base}/src/redis-server ${redis_cluster_base}/${redis_cluster_port}${i}/redis-node.conf
done
ps -ef |grep redis


