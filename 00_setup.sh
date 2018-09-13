#!/bin/bash
# ===========================================================================
# run script with 'docker-install' parameter if docker installation is needed
# ./setup.sh docker-install
# ===========================================================================

dockinstall=$1

# ===================================================================
# docker install
# ===================================================================

if [ "$dockinstall" = "docker-install" ]; then
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update

sudo apt-get install -y openssl

sudo apt-get install -y docker-ce

sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose

sudo chmod +x /usr/bin/docker-compose
fi

# ===================================================================
# deploy and setup
# ===================================================================

# create Jenkins  dirs
mkdir -p data/jenkins

# Since Jenkins running under 'jenkins' user with uuid 1000 (by default) you need to set correct rights on working folder
chmod 777 data/jenkins


#sed -e "s/changemyname/$lenj_domain $lenj_adddomains/" nginx.conf > $lenj_dockerdir/data/nginx/nginx.conf

docker-compose build
docker-compose up -d

cd $backway
