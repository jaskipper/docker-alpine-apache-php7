FROM nimmis/alpine-apache

MAINTAINER skipper <jason@skipperinnovations.com>
# disable interactive functions

RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "@edge https://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \

    # Update & upgrade apk
    apk update && apk upgrade && \

    # Make info file about this build
    printf "Build of jasonaskipper/alpine-apache-php7, date: %s\n"  `date -u +"%Y-%m-%dT%H:%M:%SZ"` >> /etc/BUILD && \

    apk add --no-cache \
            libressl@edge \
            curl \
            wget \
            openssl \
            bash \
            nano \
            php7@community \
            php7-apache2@community \
            php7-openssl@community \
            php7-mbstring@community \
            php7-apcu@testing \
            php7-intl@community \
            php7-mcrypt@community \
            php7-json@community \
            php7-gd@community \
            php7-curl@community \
            php7-fpm@community \
            php7-mysqlnd@community \
            php7-pgsql@community \
            php7-sqlite3@community \
            php7-phar@community

    # waiting for module to be release on alpine
    # apk add php7-imagick@testing

RUN ln -s /usr/bin/php7 /usr/bin/php && \
    cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && \
    rm -rf /var/cache/apk/*
