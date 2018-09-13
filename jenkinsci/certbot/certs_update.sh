#!/bin/bash

echo '0 1 * * * root certbot renew --webroot -w /data/letsencrypt --quiet' >> /etc/crontab
echo '' >> /etc/crontab
service cron start