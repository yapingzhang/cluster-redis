#!/bin/bash

. ./conf/redis-cluster.conf

if [ ${redis_cluster_node_count} -gt 10 ] 
then
	redis_cluster_node_count=10
fi

rm -rf ${redis_cluster_base}/${redis_cluster_port}*

for ((i=0;i<${redis_cluster_node_count};i++)); do
    node_port=${redis_cluster_port}${i}
    node_dir=${redis_cluster_base}/${node_port}
    mkdir ${node_dir}
    cp ${redis_cluster_base}/conf/redis-node.conf ${node_dir}
    sed -i -e '1i include '"${redis_cluster_work_base}"'/redis.conf\nport '"${node_port}"'\npidfile '"${node_dir}"'/redis.pid\ndir '"${node_dir}"'' ${node_dir}/redis-node.conf
#    cp ${redis_cluster_base}/conf/startup.sh ${node_dir}
#    sed -i -e '$a su - '"${redis_cluster_user}"' -c '"${redis_cluster_work_base}"'/src/redis-server '"${node_dir}"'/redis-node.conf' ${node_dir}/startup.sh
#    chmod a+x ${node_dir}/startup.sh
done

chown -R ${redis_cluster_user}:${redis_cluster_user} ${redis_cluster_base}/*
