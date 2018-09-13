# lenj
certbot+nginx+jenkins container, based on oficial Jenkins: https://github.com/jenkinsci/docker.git

Tested on Ubuntu server 16.04

IMPORTANT 
Before you start: 
 - FQDN must already pointing on correct ip. If not, container will be builded but cert request will be failed.
 - Replace vars values by your own info in ".env" file. 


Installation:

  Run setup.sh.

  NOTE: run script with 'docker-install' parameter if docker installation is needed: ./setup.sh docker-install

  Data folder will be created in current directory.
  Container will be builded with certbot, nginx and jenkins inside.
  Last 2 lines in script runs cert installation and adding crontab task inside container.
