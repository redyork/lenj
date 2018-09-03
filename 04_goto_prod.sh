#!/bin/bash

source vars

backway=`pwd`

sed -e "s/changemyname/$lenj_domain/" docker-compose_prod.yml > $lenj_dockerdir/docker-compose.yml
sed -e "s/changemyname/$lenj_domain $lenj_adddomains/" nginx_prod.conf > $lenj_dockerdir/data/nginx/nginx.conf

cd $lenj_dockerdir

docker-compose down --remove-orphans
docker-compose up -d

cd $backway