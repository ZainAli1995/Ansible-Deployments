#!/bin/bash

#Use this script to install ansible on the VM
#Make sure you run the script as root
#Installation on the Amazon EC2 Linux

amazon_linux(){
	sudo yum -y update &> /dev/null
	sudo amazon-linux-extras list | grep ansible2 &> /dev/null
	sudo amazon-linux-extras enable ansible2 &>/dev/null
	sudo yum -y install ansible &>/dev/null
}

centos(){
	sudo yum -y update &> /dev/null
	sudo yum -y install epel-release &> /dev/null
	sudo yum -y install ansible &> /dev/null
}

if [[ ${UID} -ne 0 ]]; then
	echo "You must be root to run this installer"
	exit 1
fi

OS_VERSION=$(hostnamectl  | grep Operating | awk -F ":" '{print $NF}' | sed 's/^ *//g')

if [[ ${OS_VERSION} = 'Amazon Linux 2' ]]; then
	amazon_linux
elif [[ ${OS_VERSION} = 'Centos 7' ]]; then
	centos
fi

VERSION=$(ansible --version)

if [[ $? -eq 0 ]]; then
	echo "Ansible Version: ${VERSION} has been installed"
	exit 0
else
	echo "Ansible Installation Failed"
	exit 1
fi
