
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF
export DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]')
export CODENAME=$(lsb_release -cs)

echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | \
  sudo tee /etc/apt/sources.list.d/mesosphere.list

sudo apt-get update
sudo apt-get -y install mesos

sudo service zookeeper stop
sudo sh -c "echo manual > /etc/init/zookeeper.override"

echo -e "zk://192.168.33.10:2181,192.168.33.11:2181,192.168.33.12:2181/mesos" | sudo tee /etc/mesos/zk

sudo service mesos-master stop
sudo sh -c "echo manual > /etc/init/mesos-master.override"

sudo service mesos-slave restart

sudo apt-get update
sudo apt-get install wget
wget -qO- https://get.docker.com/ | sudo sh


echo 'docker,mesos' | sudo tee /etc/mesos-slave/containerizers
echo '5mins' | sudo tee /etc/mesos-slave/executor_registration_timeout
echo $HOST_IP_ADDRESS | sudo tee /etc/mesos-slave/hostname
echo $HOST_IP_ADDRESS | sudo tee /etc/mesos-slave/ip


sudo service mesos-slave restart
 

