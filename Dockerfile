ARG PHP_EXTENSIONS="gd"

FROM thecodingmachine/php:7.2-v2-cli-node12

USER root
RUN cd /tmp && \
 curl -O "https://raw.githubusercontent.com/pantheon-systems/terminus-installer/master/builds/installer.phar" && \
 php installer.phar install && \
 npm i -g gulp gulp-cli
