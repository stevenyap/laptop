#!/bin/bash

set -e

# variables
MACHINE_NAME=tao

echo 'Basic Setup of Mac'

if [[ hostname -ne MACHINE_NAME ]]; then
	echo "Set machine name to $MACHINE_NAME"
	sudo scutil --set HostName $MACHINE_NAME
fi

if [[ ! -x `xcode-select -p` ]]; then
	echo 'Install Xcode command'
	code-select --install
fi

if [[ ! -x `which pip` ]]; then
	echo 'Install pip'
	sudo easy_install pip
fi

if [[ -x `which pip` && ! -x `which ansible` ]]; then
	echo 'Install Ansible using pip'
	sudo CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip install ansible
fi

echo 'Running Ansible to configure Dev machine'

if [[ ! -e hosts ]]; then
	echo localhost ansible_connection=local >> hosts
fi

if [[ -x `which ansible` ]]; then
	ansible-playbook -i hosts site.yml --ask-sudo-pass -vvvv
fi
