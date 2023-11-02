xITee homework - ansible playbook
================================================================================
The playbook is divided into following roles:

- Configure firewall                                / firewall role
- Create user 'xitest', add ssh keys                / users role
- Install Wordpress in Docker                       / wordpress role  
- Website & DB backup daily at 8:00,16:00,24:00     / backup role

Enviroment used: Alma Linux 9.2

Please take the following steps to prepare your enviroment:
 
### Install GIT, Add EPEL repository and install Ansible
```
sudo yum update
sudo yum install git -y
sudo dnf update -y
sudo dnf install -y epel-release
sudo dnf install ansible -y
```

### To execute the playbook run:
```
sudo ansible-playbook site.yml
```

### Possible dependencies TBD
```
sudo pip3 install requests
sudo yum install python-requests
sudo yum install python python3-pip
sudo pip3 install docker
```

 KNOWN ISSUES
================================================================================
- firewall

>fatal: [localhost]: FAILED! => {"changed": false, "msg": "Failed to import the required Python library (firewall) on localhost.localdomain's Python /usr/bin/python3.11. Please read the module documentation and install it in the appropriate location. If the required library is installed, but Ansible is using the wrong Python interpreter, please consult the documentation on ansible_python_interpreter. Version 0.2.11 or newer required (0.3.9 or newer for offline operations)"}

- wordpress

>An exception occurred during task execution. To see the full traceback, use -vvv. The error was: ModuleNotFoundError: No module named 'requests'
>fatal: [localhost]: FAILED! => {"changed": false, "msg": "Failed to import the required Python library (requests) on localhost.localdomain's Python /usr/bin/python3.11. Please read the module documentation and install it in the appropriate location. If the required library is installed, but Ansible is using the wrong Python interpreter, please consult the documentation on ansible_python_interpreter"}

 TODO 
================================================================================
- users - sudo
- wordpress, mariadb
- backup - script config/test
- vars, hosts