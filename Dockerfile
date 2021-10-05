ARG PHP_EXTENSIONS="gd gettext gmp gnupg igbinary imagick imap zip soap"
ARG NODE_VERSION=12

FROM thecodingmachine/php:7.4-v4-slim-cli

USER root
RUN cd /tmp && \
 curl -O "https://raw.githubusercontent.com/pantheon-systems/terminus-installer/master/builds/installer.phar" && \
 apt-get install rsync -y && \
 apt-get install patch -y && \
 apt-get install php7.4-zip -y && \
 php installer.phar install && \
 npm install -g gulp-cli && \
 npm install -g gulp
