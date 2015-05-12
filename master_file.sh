
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
export DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
export CODENAME=$(lsb_release -cs)

echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | \
  sudo tee /etc/apt/sources.list.d/mesosphere.list

sudo apt-get update
sudo apt-get -y install mesos marathon

echo $ZOOKEEPER_MY_ID | sudo tee /etc/zookeeper/conf/myid

echo -e "server.1=192.168.33.10:2888:3888\nserver.2=192.168.33.11:2888:3888\nserver.3=192.168.33.12:2888:3888" | sudo tee -a /etc/zookeeper/conf/zoo.cfg

sudo service zookeeper restart

echo "zk://192.168.33.10:2181,192.168.33.11:2181,192.168.33.12:2181/mesos" | sudo tee /etc/mesos/zk

echo "2" | sudo tee /etc/mesos-master/quorum
echo $HOST_IP_ADDRESS | sudo tee /etc/mesos-master/hostname
echo $HOST_IP_ADDRESS | sudo tee /etc/mesos-master/ip
echo "Cluster01" | sudo tee /etc/mesos-master/cluster

sudo service mesos-slave stop
sudo sh -c "echo manual > /etc/init/mesos-slave.override"

sudo service mesos-master restart
sudo service marathon restart

curl -sSfL http://downloads.mesosphere.io/chronos/chronos-2.1.0_mesos-0.14.0-rc4.tgz --output chronos.tgz

tar xzf chronos.tgz 

echo -e "description \"Chronos scheduler for Mesos\"\n\nstart on runlevel [2345]\nstop on runlevel[!2345]\n\nrespawn\nrespawn limit 10 5\n\nscript\ncd /home/vagrant/chronos;./bin/start-chronos.bash --master `cat /etc/mesos/zk` --zk_hosts `cat /etc/mesos/zk` --http_port 8081 >> /var/log/mesos/chronos.log 2>&1\nend script\n" | sudo tee /etc/init/chronos.conf



