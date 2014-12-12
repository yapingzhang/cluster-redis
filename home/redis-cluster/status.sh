#!/bin/bash
. ./conf/redis-cluster.conf
${redis_cluster_work_base}/src/redis-cli -p 13301 cluster nodes