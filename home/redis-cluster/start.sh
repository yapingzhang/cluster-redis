cd  /home/redis-cluster/13300 &&\
/home/redis/src/redis-server redis-node.conf &&\
cd  /home/redis-cluster/13301 &&\
/home/redis/src/redis-server redis-node.conf &&\
cd  /home/redis-cluster/13302 &&\
/home/redis/src/redis-server redis-node.conf &&\
cd  /home/redis-cluster/13303 &&\
/home/redis/src/redis-server redis-node.conf &&\
ps -ef |grep redis