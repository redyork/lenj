#!/bin/bash

source vars

backway=`pwd`

docker pull certbot/certbot

mkdir -p  $lenj_dockerdir/www
mkdir -p  $lenj_dockerdir/data/nginx

mkdir -p $lenj_dockerdir/data/nginx

openssl dhparam -out $lenj_dockerdir/nginx/dhparam-2048.pem 2048

cp docker-compose.yml $lenj_dockerdir/
cp nginx.conf $lenj_dockerdir/data/nginx/
cp index.html $lenj_dockerdir/www/

cd $lenj_dockerdir

docker-compose up -d

cd $backway