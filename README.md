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

 TODO 
================================================================================
- wordpress, mariadb
- backup - script config/test
- vars, hosts