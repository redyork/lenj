#!/bin/bash

source vars

docker pull certbot/certbot

sudo mkdir -p  $lenj_destdir/letsencrypt-site
cp docker-compose.yml $lenj_destdir/
cp nginx.conf $lenj_destdir/
cp index.html $lenj_destdir/letsencrypt-site


