ARG PHP_EXTENSIONS="gd gettext gmp gnupg igbinary imagick imap zip soap"

FROM thecodingmachine/php:7.2-v2-cli-node12

USER root
RUN cd /tmp && \
 curl -O "https://raw.githubusercontent.com/pantheon-systems/terminus-installer/master/builds/installer.phar" && \
 php installer.phar install && \
 npm i -g gulp gulp-cli

ENV APP_ENV=prod \
    APACHE_DOCUMENT_ROOT=public/

COPY --from=builder /var/www/html .