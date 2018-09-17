FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y -qq cron certbot nginx git curl && rm -rf /var/lib/apt/lists/*


COPY start.sh /usr/local/bin/start.sh
COPY nginx/dhparam-2048.pem /etc/nginx/dhparam-2048.pem
COPY nginx/nginx_http.conf /etc/nginx/nginx_http.conf
COPY nginx/nginx_http.conf /etc/nginx/sites-enabled/default
COPY nginx/nginx_ssl.conf /etc/nginx/nginx_ssl.conf
COPY certbot/certs_update.sh /root/certs_update.sh
COPY certbot/install_certs.sh /root/install_certs.sh

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/start.sh"]
