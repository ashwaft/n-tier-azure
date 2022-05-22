#!/bin/bash
sudo systemctl stop firewalld
sudo systemctl disable firewalld
curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
yum install -y nodejs
npm install -g serve
wget https://github.com/bwhsdzf/smartbankdeploypack/archive/refs/heads/master.zip
unzip master.zip
cd smart*
serve -s build