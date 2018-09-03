#!/bin/bash

cd 'PLACE CORRECT PATH TO THIS SCRIPT HERE'
source vars

docker run -it --rm --name certbot -v $lenj_dockerdir/data/etc/letsencrypt:/etc/letsencrypt \
-v $lenj_dockerdir/data/var/lib/letsencrypt:/var/lib/letsencrypt \
-v $lenj_dockerdir/www:/data/letsencrypt \
-v $lenj_dockerdir/data/var/log/letsencrypt:/var/log/letsencrypt \
certbot/certbot renew --webroot -w /data/letsencrypt --quiet && docker kill --signal=HUP production-nginx-container
