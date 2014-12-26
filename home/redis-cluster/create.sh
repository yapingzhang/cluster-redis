#!/bin/bash

redis_cluster_base=$(cd `dirname $0`; pwd)
. ${redis_cluster_base}/conf/redis-cluster.conf

for ((i=0;i<${redis_cluster_node_count};i++)); do
    node_port=${redis_cluster_port}${i}
    for ((j=0;j<${#redis_cluster_hosts[*]};j++)); do
        redis_cluster_list=${redis_cluster_list}${redis_cluster_hosts[j]}":"${node_port}" "
    done
done

echo ${redis_cluster_list}

#${redis_cluster_work_base}/src/redis-trib.rb create --replicas 1 ${redis_cluster_list}

#${redis_cluster_work_base}/src/redis-trib.rb create --replicas 1 \
#192.168.105.21:13300 \
#192.168.105.22:13300 \
#192.168.105.21:13301 \
#192.168.105.22:13301 \
#192.168.105.21:13302 \
#192.168.105.22:13302 \
#192.168.105.21:13303 \
#192.168.105.22:13303 