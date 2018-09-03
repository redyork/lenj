#!/bin/bash

source vars

backway=`pwd`

docker pull certbot/certbot
docker pull yorkred/jenkins

mkdir -p $lenj_dockerdir/www
mkdir -p $lenj_dockerdir/jenkins
mkdir -p $lenj_dockerdir/data/nginx

chmod 777 $lenj_dockerdir/jenkins


cat > $lenj_dockerdir/jenkins/log.properties <<EOF
handlers=java.util.logging.ConsoleHandler
jenkins.level=FINEST
java.util.logging.ConsoleHandler.level=FINEST
EOF

openssl dhparam -out $lenj_dockerdir/data/nginx/dhparam-2048.pem 2048

cp docker-compose.yml $lenj_dockerdir/
sed -e "s/changemyname/$lenj_domain $lenj_adddomains/" nginx.conf > $lenj_dockerdir/data/nginx/nginx.conf
cp index.html $lenj_dockerdir/www/

cd $lenj_dockerdir

docker-compose up -d

cd $backway