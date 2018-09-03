# lenj
LE+nginx+jenkins

Tested on Ubuntu server 16.04

Installation:
- Replace vars values by your own info in "vars" file. This variables are using in all bash scripts.
- [Optional] Run 00_docker_install.sh. It will install docker, docker-composer and openssl
- Run 01_init.sh. 
  It will do next:
   - create dirs
   - make basic config for nginx and first docker-compose file
   - generate dhparam file for nginx
   - run nginx container
- [Optional] Run 02_certbot_test.sh. It will make TEST request to lentsencrypt (using "staging" option) and generate TEST certificates. If all is ok, you are ready to:
- Run 03_certbot_init.sh. It will install working certificates, make final docker-compose file and will run containers.
- Run 04_goto_prod.sh to copy final configs and run jenkins container.


- Add in /etc/crontab file:
  0 1 * * * root /path-to-script/certs_update.sh
