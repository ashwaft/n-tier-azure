#!/bin/bash
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo yum install -y stress
sudo yum install -y java
wget https://github.com/pranjal4113/fordocker/archive/refs/heads/main.zip
unzip main.zip
cd for*
sudo java -Dserver.port=80 -jar smart-bank-api.jar &

