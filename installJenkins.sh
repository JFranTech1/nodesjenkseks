#!/bin/bash

#check for which 
os=$(lsb_release -d | awk '{print $2}')

#update system 
sudo apt-get update -y 
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update -y
#install java
sudo apt-get install openjdk-11-jdk ca-certificates curl gnupg -y

#check and add jenkins to repo list
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

#update system to pull repo 
sudo apt-get update -y 

echo '-----------------install jenkins------------------------------------'
#install jenkins using apt package management
sudo apt-get install jenkins -y

echo '-----------------install nodejs------------------------------------'
curl -sL https://deb.nodesource.com/setup_20.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
sudo apt install nodejs -y



echo '-----------------install docker------------------------------------'

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable docker-ce
#enable jenkins to start when system starts
sudo systemctl enable jenkins

echo '-----------------Complete------------------------------------'




