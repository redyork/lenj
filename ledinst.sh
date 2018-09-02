#!/bin/bash

trgtdir='/docker/letsencrypt-docker-nginx/src/letsencrypt/'


sudo mkdir -p  $trgtdir/letsencrypt-site

cp docker-compose.yml $trgtdir/
cp nginx.conf $trgtdir/
cp index.html $trgtdir/letsencrypt-site

cd $trgtdir
sudo docker-compose up -d


