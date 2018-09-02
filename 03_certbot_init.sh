#!/bin/bash
source vars

if [ -z "$lenj_adddomains" ]; then
    adddomain=''
else
    for dm in $lenj_adddomains
    do
        adddomain=`echo -n "$adddomain -d $dm"`
    done
fi


docker run -it --rm -v $lenj_dockerdir/data/etc/letsencrypt:/etc/letsencrypt \
-v $lenj_dockerdir/data/var/lib/letsencrypt:/var/lib/letsencrypt \
-v $lenj_dockerdir/www:/data/letsencrypt \
-v $lenj_dockerdir/data/var/log/letsencrypt:/var/log/letsencrypt \
certbot/certbot \
certonly --webroot \
--email $lenj_email --agree-tos --no-eff-email \
--webroot-path=/data/letsencrypt \
-d $lenj_domain $adddomain

