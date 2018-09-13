#!/bin/bash

docker-compose exec jenkinsci /root/install_certs.sh

docker-compose exec jenkinsci /root/certs_update.sh