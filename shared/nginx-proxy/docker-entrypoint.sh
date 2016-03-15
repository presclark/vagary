#!/bin/bash
cp /app/default.conf /etc/nginx/conf.d/default.conf
exec ./original-docker-entrypoint.sh "$@"
