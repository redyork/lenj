#! /bin/bash -e

sleep 5

/usr/sbin/nginx

su -c '/sbin/tini -- /usr/local/bin/jenkins.sh' jenkins

exec "$@"