#!/bin/bash

source vars

backway=`pwd`

#certbot container
docker pull certbot/certbot

#jenkins container
git clone https://github.com/jenkinsci/docker.git $lenj_dockerdir/jenkinsci

#adding nginx in jenkins container
sed -i -e 's/^ENTRYPOINT*/ENTRYPOINT ["\/sbin\/tini", "--", "\/usr\/local\/bin\/start.sh"]\n\#&/' -e 's/USER \${user}/\#&\nRUN apt-get update \&\& apt-get install -y nginx/' $lenj_dockerdir/jenkinsci/Dockerfile
sed -i -e 's/^COPY jenkins\.sh*/COPY start.sh \/usr\/local\/bin\/start.sh \n&/' $lenj_dockerdir/jenkinsci/Dockerfile
cp start.sh $lenj_dockerdir/jenkinsci/
chmod +x $lenj_dockerdir/jenkinsci/start.sh

#working dirs
mkdir -p $lenj_dockerdir/www
mkdir -p $lenj_dockerdir/data/nginx
mkdir -p $lenj_dockerdir/data/jenkins

chmod 777 $lenj_dockerdir/data/jenkins


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

docker-compose build
docker-compose up -d

cd $backway