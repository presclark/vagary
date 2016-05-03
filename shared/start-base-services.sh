#! /bin/bash

cd /var/shared/mysql
docker-compose up -d

cd /var/shared/postgres
docker-compose up -d

cd /var/shared/nginx-proxy
docker-compose up -d
