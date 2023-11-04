xITee homework - ansible playbook
================================================================================
The playbook is divided into following roles:

- firewall  | Configure firewall, fail2ban
- users     | Create user 'xitest', add ssh keys
- wordpress | Install Wordpress & MariaDB in Docker/Podman  
- backup    | Website & DB backup daily at 8:00,16:00,24:00

Enviroment used: Alma Linux 9.2

Please take the following steps to prepare your enviroment:
 
### Install GIT, Add EPEL repository and install Ansible
```
sudo yum update -y
sudo yum install -y git
sudo dnf update -y
sudo dnf install -y epel-release
sudo dnf install -y ansible
```

### To clone this repository run:
```
git clone https://github.com/dh-xitee/homework
```

### To execute the playbook run:
```
sudo ansible-playbook homework/site.yml
```