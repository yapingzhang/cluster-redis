#!/bin/bash
redis_cluster_base=$(cd `dirname $0`; pwd)
. ${redis_cluster_base}/conf/redis-cluster.conf
${redis_cluster_work_base}/src/redis-cli -p 13300 cluster nodes