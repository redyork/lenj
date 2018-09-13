#!/bin/bash

sed -i "s/DOMAINNAME/$DOMAINNAME/" /etc/nginx/sites-enabled/default
sed -i "s/ADDDOMAINS/$ADDDOMAINS/" /etc/nginx/sites-enabled/default

nginx -s reload

if [ -z "$ADDDOMAINS" ]; then
    adddomain=''
else
    for dm in $ADDDOMAINS
    do
        adddomain=`echo -n "$adddomain -d $dm"`
    done
fi

certbot certonly --webroot -m $LEEMAIL --agree-tos --webroot-path=/data/letsencrypt -d $DOMAINNAME $adddomain

cp /etc/nginx/nginx_ssl.conf /etc/nginx/sites-enabled/default
sed -i "s/DOMAINNAME/$DOMAINNAME/" /etc/nginx/sites-enabled/default
sed -i "s/ADDDOMAINS/$ADDDOMAINS/" /etc/nginx/sites-enabled/default

nginx -s reload

