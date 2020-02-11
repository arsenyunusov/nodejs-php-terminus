ARG PHP_EXTENSIONS="gd gettext gmp gnupg igbinary imagick imap zip soap"

FROM thecodingmachine/php:7.2-v2-cli-node12 AS build

USER root
RUN cd /tmp && \
 curl -O "https://raw.githubusercontent.com/pantheon-systems/terminus-installer/master/builds/installer.phar" && \
 php installer.phar install && \
 npm install -g gulp-cli && \
 npm install -g gulp

# The slim image will automatically build the extensions from the list provided at the very top of the file.
FROM thecodingmachine/php:7.2-v2-slim-cli

COPY --from=build / .

USER root
RUN cd /tmp && \
 curl -O "https://raw.githubusercontent.com/pantheon-systems/terminus-installer/master/builds/installer.phar" && \
 php installer.phar install && \
 npm install -g gulp-cli && \
 npm install -g gulp