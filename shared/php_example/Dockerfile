FROM debian:jessie

RUN apt-get update \
	&& apt-get install -y \
		php5-cgi \
		php5 \
		php5-curl \
		php5-json \
		php5-mysql \
		php5-gd \
		php5-mcrypt \
		php5-xdebug \
	&& rm -rf /var/lib/apt/lists/*

