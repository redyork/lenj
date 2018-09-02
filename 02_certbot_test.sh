#!/bin/bash
source vars
sudo docker run --exec-driver=lxc -it --rm -v /docker-volumes/etc/letsencrypt:/etc/letsencrypt -v /docker-volumes/var/lib/letsencrypt:/var/lib/letsencrypt \
-v /docker/letsencrypt-docker-nginx/src/letsencrypt/letsencrypt-site:/data/letsencrypt \
-v "/docker-volumes/var/log/letsencrypt:/var/log/letsencrypt" \
certbot/certbot \
certonly --webroot \
--email $lenj_email --agree-tos --no-eff-email \
--webroot-path=/data/letsencrypt \
--staging \
-d $lenj_domain
