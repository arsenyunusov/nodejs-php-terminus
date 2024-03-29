ARG PHP_EXTENSIONS="gd gmp igbinary imagick imap zip soap"
ARG NODE_VERSION=12

FROM thecodingmachine/php:8.1-v4-slim-cli

USER root
RUN cd /tmp && \
 curl -O "https://raw.githubusercontent.com/pantheon-systems/terminus-installer/master/builds/installer.phar" && \
 apt-get update -y && \
 apt-get install rsync -y && \
 php installer.phar install && \
 npm install -g gulp-cli && \
 npm install -g gulp
