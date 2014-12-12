#!/bin/bash

. ./conf/redis-cluster.conf

if [ ${redis_cluster_node_count} -gt 10 ] 
then
	redis_cluster_node_count=10
fi

for ((i=0;i<${tomcat_cluster_node_count};i++)); do
    node_port=${redis_cluster_port}${i}
    node_dir=${redis_cluster_base}/${node_port}
    mkdir ${node_dir}
    cp ${redis_cluster_base}/conf/redis-node.conf ${node_dir}
    node_conf=${node_dir}/redis-node.conf
    sed -i -e '/include/a '"${redis_cluster_work_base}"'/redis.conf' ${node_conf}
    sed -i -e '/port/a '"${node_port}"'' ${node_conf}
    sed -i -e '/pidfile/a '"${node_dir}"'/redis.pid' ${node_conf}
done

chown -R redis_cluster_user:redis_cluster_user ${redis_cluster_base}/*
