FROM jwilder/nginx-proxy:latest

# Back up the original nginx conf so we can restore it on startup
RUN cp /etc/nginx/conf.d/default.conf /app/default.conf

# Add a new entrypoint that restores the default nginx conf on startup; this
# fixes breakage on container restart from the below tweaked template, since
# nginx can't find the old hosts
RUN mv /app/docker-entrypoint.sh /app/original-docker-entrypoint.sh
ADD docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod a+x /app/docker-entrypoint.sh

# Add tweaked template to support v2 Compose files
ADD nginx.tmpl /app/nginx.tmpl
