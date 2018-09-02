#!/bin/bash
source vars

docker run -it --rm -v $lenj_dockerdir/data/etc/letsencrypt:/etc/letsencrypt \
-v $lenj_dockerdir/data/var/lib/letsencrypt:/var/lib/letsencrypt \
-v $lenj_dockerdir/www:/data/letsencrypt \
-v $lenj_dockerdir/data/var/log/letsencrypt:/var/log/letsencrypt \
certbot/certbot \
certonly --webroot \
--email $lenj_email --agree-tos --no-eff-email \
--webroot-path=/data/letsencrypt \
--staging \
-d $lenj_domain

