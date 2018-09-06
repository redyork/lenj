#!/bin/bash

source vars

backway=`pwd`

sed -e "s/changemyname/$lenj_domain $lenj_adddomains/" nginx_prod.conf > $lenj_dockerdir/data/nginx/nginx.conf

cd $lenj_dockerdir

docker-compose stop jenkinsci
docker-compose up -d

cd $backway