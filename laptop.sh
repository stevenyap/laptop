#!/bin/bash

set -e

command_exists () {
  type "$1" &> /dev/null
}

if [ ! -x `xcode-select -p` ]; then
	echo 'Installing Xcode command...'
	xcode-select --install
fi

if ! command_exists pip ; then
	sudo easy_install pip
	sudo pip install --user paramiko PyYAML Jinja2 httplib2 six
fi

if [ -e ~/ansible/hacking/env-setup ]; then
	source ~/ansible/hacking/env-setup
fi

if ! command_exists ansible ; then
  echo 'Installing ansible...'
  git clone git://github.com/ansible/ansible.git --recursive ~/ansible
  source ~/ansible/hacking/env-setup
fi

echo 'Running Ansible to configure Dev machine'

if [ ! -e hosts ]; then
	echo localhost ansible_connection=local >> hosts
fi

if command_exists ansible ; then
	ansible-playbook -i hosts site.yml --ask-become-pass -v
fi
