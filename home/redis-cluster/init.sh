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
    node_conf=${node_dir}/redis-node.conf
#    sed -i -e '/include/a '"${redis_cluster_work_base}"'/redis.conf' ${node_conf}
#    sed -i -e '/port/a '"${node_port}"'' ${node_conf}
#    sed -i -e '/pidfile/a '"${node_dir}"'/redis.pid' ${node_conf}
#    sed -i -e '1a include '"${redis_cluster_work_base}"'/redis.conf \nport '"${node_port}"' \npidfile '"${node_dir}"'/redis.pid' ${node_conf}
    sed -i -e 's/#include/include '"${redis_cluster_work_base}"'/redis.conf/g' ${node_conf}
    sed -i -e 's/#port/'"${node_port}"'/g' ${node_conf}
    sed -i -e 's/#pidfile/'"${node_dir}"'/redis.pid/g' ${node_conf}
    sed -i -e 's/#dir/'"${node_dir}"'/redis.pid/g' ${node_conf}
done

chown -R ${redis_cluster_user}:${redis_cluster_user} ${redis_cluster_base}/*
