#!/bin/bash

#remove any docker
yum remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
#docker install
yum update -y
yum install -y yum-utils \
	device-mapper-persistent-data \
	lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
	
yum install -y docker-ce
curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

groupadd docker
usermod -aG docker $USER
systemctl enable docker
systemctl start docker

#add hosts
cat <<EOF >>  /etc/hosts
10.90.2.41   hb-master01
10.90.2.51   hb-master02
10.90.2.61   hb-master03
10.90.2.42   hb-node01
10.90.2.52   hb-node02
10.90.2.62   hb-node03
EOF

#Disable SELinux
setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

#Enable br_netfilter Kernel Module
modprobe br_netfilter
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables

#Disable SWAP
swapoff -a
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

#disable firewall
systemctl disable firewalld
systemctl stop firewalld

#disable iptables
service iptables save
service iptables stop
chkconfig iptables off

service ip6tables save
service ip6tables stop
chkconfig ip6tables off

#install kubeadm, kubectl kubelet
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kube*
EOF

yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
systemctl enable kubelet && systemctl start kubelet

cat <<EOF >  /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sysctl --system
#root perm to cluster
cat <<EOF >>  ~/.bashrc
KUBECONFIG=/etc/kubernetes/admin.conf
EOF
source ~/.bashrc

#Change the cgroup-driver
sed -i 's/cgroup-driver=systemd/cgroup-driver=cgroupfs/g' /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
systemctl daemon-reload
systemctl restart kubelet