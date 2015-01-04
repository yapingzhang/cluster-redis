#!/bin/bash

echo "初始化redis集群"
redis_cluster_base=$(cd `dirname $0`; pwd)
. ${redis_cluster_base}/conf/redis-cluster.conf


if [ ${redis_cluster_node_count} -gt 10 ] 
then
	redis_cluster_node_count=10
fi

rm -rf ${redis_cluster_base}/${redis_cluster_port}*

for ((i=0;i<${redis_cluster_node_count};i++)); do
    node_port=${redis_cluster_port}${i}
    node_dir=${redis_cluster_base}/${node_port}
    if [ ! -e ${node_dir} ]; then
        mkdir ${node_dir}
    fi
    cp ${redis_cluster_base}/conf/redis-node.conf ${node_dir}
    sed -i -e '1i include '"${redis_cluster_work_base}"'/redis.conf\nport '"${node_port}"'\npidfile '"${node_dir}"'/redis.pid\ndir '"${node_dir}"'' ${node_dir}/redis-node.conf
done

chown -R ${redis_cluster_user}:${redis_cluster_user} ${redis_cluster_base}/*
