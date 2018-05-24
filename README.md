# Usefull_Commands
I used to search in net for commands syntax. it's better to collect them for others.

# run a command in ubuntu
ctrl+alt+T to open a terminal
alt+F2 to execute a command without terminal

//update url of wordpress
/////////////////////////////////////////////////////
////////best way to replace all in editor////////////
/////////////////////////////////////////////////////
/////// sed -i -e 's/http\:\/\/url\.com/http\:\/\/localhost\:port/g' hello.txt ///////////
/////////////////////////////////////////////////////
update wp_options set option_value = 'url:port' where option_name = 'siteurl';
update wp_options set option_value = 'url:port' where option_name = 'home';
UPDATE wp_links SET link_image = REPLACE(link_image,'old_url','');
UPDATE wp_links SET link_url = REPLACE(link_url,'old_url','');
UPDATE wp_posts SET post_content = REPLACE(post_content,'old_url','');
UPDATE wp_postmeta SET meta_value = REPLACE(meta_value,'old_url','');

//split a movie
ffmpeg -ss 00:00:00 -t 00:46:00 -i inputfile outputfile

# find last change files
find /<directory> -newermt "-24 hours" -ls

//about mail
pop3 can delete on serve but IMAP not.

# ssh login without anyone know
* at the end of ssh session :
find / -mtime -1 |grep -v 'proc\|module\|cache\|lib\|kernel\|/sys/\|devices'
* rm files that think log you
rm /var/log/wtmp /var/log/btmp /var/log/lastlog
touch /var/log/wtmp /var/log/btmp /var/log/lastlog
history -c

# change grub2 mode
sudo vi /etc/default/grub
GRUB_CMDLINE_LINUX="text"
update-grub2

# obtain JAVA_HOME etc.
vi /etc/environment
export

# send stdout & stderr to /dev/null
> /dev/null 2>&1

# display colored in bash
??

# create new user
docker exec -ti [name_of_ocsrv_container] ocpasswd -c /etc/ocserv/ocpasswd -g "Route,All" username

# connect to server from client with openconnect
sudo openconnect [IP or URL] --user=username -p=password --authgroup=route    --servercert sha256:[has given on first use from bash]


# install docker on ubuntu 16.04
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-compose

# install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# docker pull , export and import from host to host
docker pull ubuntu
docker run -t -i ubuntu /bin/bash

# after desired changes, in another bash
docker ps
docker export ID | gzip > ubuntu.tar.gz
# in another host
gzcat ubuntu.tar.gz | docker import - ubuntu-alice
docker save ubuntu | gzip > ubuntu-golden.tar.gz
gzcat ubuntu-golden.tar.gz | docker load

# docker pull and transfer to another repo
docker pull ubuntu
docker tag ubuntu another_repo
docker push another_repo


# import data to exist database in mysql/mariadb docker container
docker exec -i container_name mysql -uUser -pPassword --database=DBName < sqlfile

# disable startup docker containers
* in /va/var/lib/docker/containers
grep -irn '"RestartPolicy":{"Name":"always"' | cut -d \: -f 1
# the result list is files with restartpolicy; change them to "RestartPolicy":{"Name":"no"
grep -irn '"RestartPolicy":{"Name":"always"' | cut -d \: -f 1 | xargs -n 1 sed -i s/'"RestartPolicy":{"Name":"always"'/'"RestartPolicy":{"Name":"no"'/g

//bash of docker container
docker exec -it container_name bash

# start docker container with systemd in centos 7
# add container.service to /etc/systemd/system/
[Unit]
Description=Redis container
After=docker.service

[Service]
Restart=always
ExecStart=/usr/bin/docker start -a redis_server
ExecStop=/usr/bin/docker stop -t 2 redis_server

[Install]
WantedBy=local.target

# change docker containers
* after changes:
docker commit container_name desired_name

# multi (two and more) commands in docker container with exec option
docker exec -ti [name_of_ocsrv_container] bash -c 'command1;command2;....'

# delete container
docker rm ocserv

# stop and start docker daemon
service docker stop
service docker start

# check started containers
docker ps

# annyconnect ocserv with docker

* create and run new ocserv
* https://github.com/TommyLau/docker-ocserv
sudo docker run --name [name_of_ocsrv_container] --privileged -p 443:443 -p 443:443/udp -d tommylau/ocserv

# bash of ocserv
docker exec -it [ocserv_container_name] bin/bash
ps aux | grep ^test | cut -d \  -f 6

# gitlab runner
* Stop and remove the existing container:
docker stop gitlab-runner && docker rm gitlab-runner

* Start the container as you did originally:
docker run -d --name [container_name] --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner \
  gitlab/gitlab-runner:latest

# with ssl
docker run -d --name [container_name] --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /srv/gitlab-runner/config:/etc/gitlab-runner:Z \
  gitlab/gitlab-runner:latest

# link css
 <link rel="stylesheet" type="text/css" href="theme.css">

# mongodb

# switched to mongodb shell
 mongo

# list all databases
 db.adminCommand('listDatabases')

# use a database
 use [dbname]

# show all collections
 show collections

# select all from a collection
 db.[collname].find()

# update a
 db.[collname].update(
    { "[field]" : "[citria(first)]" },
    {
      $set: { "[setfield]": "[updatedVal]" },
      $currentDate: { "lastModified": true } //current date
    }
)

db.users.update( {"username":"[username]"},
{$set :{"emails" : [
			{ "address" : "[email@domain.com]",
			 "verified" : true
			 }
		    ]
	}
})

# avoid duplicte value in bash
export HISTCONTROL=ignoreboth:erasedups # in .bash_rc

# unlimited bash history
export HISTFILESIZE=
export HISTSIZE=
# don’t store specific lines in bash history
HISTCONTROL=ignoreboth

# record timestamp for each line
HISTTIMEFORMAT='%F %T '

# save history immediately
PROMPT_COMMAND='history -a'

# append instead of writing
shopt -s histappend

# use one command per line
shopt -s cmdhist

# kill all instances of an app with bash
ps aux | grep [app_name] | cut -d \  -f 4,5,6 | xargs -n 1 kill -9

# usefull alias for ~/.bashrc or /etc/bash.bashrc
alias rm='rm -i'

# Prompt for history -c 
* not sure to work
history(){
	if [ "$1" = "-c" ]
	then
		echo "are you sure to delete all history?(y/n):" 
		if [ "$2" = "y" ]
		then
			history -c
		fi
	else
		history "$1"
	fi
} 

# crontab for history
??

# diffrences between initd,SysV,systemD and upstart
initd: /etc/init.d/[services] start/stop/status/restart/reload
SysV: update-rc.d [service] remove/start/stop/status/restart/reload # or remove it from /etc/rc.*
SystemD: systemctl disable/enable/start/stop/status/restart/reload [services]
upstart: ??


# ignore labtop lid suspend on close
su -c 'vi /etc/systemd/logind.conf'

* and set HandleLidSwitch to ignore:
HandleLidSwitch=ignore
* and then restart systemd
su -c 'systemctl restart systemd-logind.service'

# login without password to ssh
ssh-keygen
ssh-copy-id user@host

#DirectAdmin multi php version

#SSL/TLS
* https
	- ??
* ssh
	- ??

#change ports with firewall (iptables-ufw-firewalld)
refrence: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-basic-iptables-firewall-on-centos-6
	*blocking null packets.
		iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
		The attack patterns use these to try and see how we configured the VPS and find out weaknesses
	*reject syn-flood attack
		iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
		attackers open a new connection, but do not state what they want (ie. SYN, ACK, whatever)
	*XMAS packets
		iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP
	*Open all Local
		iptables -A INPUT -i lo -j ACCEPT
	*Allow webserver traffic
		iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
		iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
	*Allow email ports (SMTP,POP3,IMAP)
		iptables -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
		iptables -A INPUT -p tcp -m tcp --dport 465 -j ACCEPT
		iptables -A INPUT -p tcp -m tcp --dport 110 -j ACCEPT
		iptables -A INPUT -p tcp -m tcp --dport 995 -j ACCEPT
		iptables -A INPUT -p tcp -m tcp --dport 143 -j ACCEPT
		iptables -A INPUT -p tcp -m tcp --dport 993 -j ACCEPT
	*Allow SSH on desired port
		iptables -A INPUT -p tcp -m tcp --dport [port] -j ACCEPT
	*Allow SSH on desired port for my IP
		iptables -A INPUT -p tcp -s YOUR_IP_ADDRESS -m tcp --dport [port] -j ACCEPT
	*Allow us to use outgoing connections (ie. ping from VPS or run software updates);
		iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
	*block everything else
		iptables -P OUTPUT ACCEPT
		iptables -P INPUT DROP		
# disable root login
ref: https://github.com/jrleszcz/linux-server-setup
	* edit sshd file
		/etc/ssh/sshd_config		
		-change:
			# Authentication:
			PermitRootLogin no
		reload ssh