source /tmp/user-shell/common_ubuntu.sh

export ZOOKEEPER_MY_ID=3
export HOST_IP_ADDRESS=192.168.33.12

source /tmp/user-shell/master_file.sh

curl -sSfL http://downloads.mesosphere.io/chronos/chronos-2.1.0_mesos-0.14.0-rc4.tgz --output chronos.tgz

tar xzf chronos.tgz && cd chronos

pwd 

./bin/start-chronos.bash --master `cat /etc/mesos/zk` --zk_hosts `cat /etc/mesos/zk` --http_port 8081 &

