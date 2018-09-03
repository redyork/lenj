#!/bin/bash

#cd 'PLACE CORRECT PATH TO THIS SCRIPT HERE'

source vars

docker run -it --rm --name certbot -v $lenj_dockerdir/data/etc/letsencrypt:/etc/letsencrypt \
-v $lenj_dockerdir/data/var/lib/letsencrypt:/var/lib/letsencrypt \
-v $lenj_dockerdir/www:/data/letsencrypt \
-v $lenj_dockerdir/data/var/log/letsencrypt:/var/log/letsencrypt \
certbot/certbot renew --webroot -w /data/letsencrypt --quiet

error=""
for container in $(docker ps | grep 'yorkred/jenkins' | awk '{print $1}'); do
    echo "------------------------------------------------------------"
       docker exec $container sudo /usr/sbin/nginx -s reload
       error=$error$?
done
if [ "$error" -gt "0" ]; then
error=1
else
error=0
fi
exit $error
