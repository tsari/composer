FROM tsari/wheezy-apache-php
MAINTAINER Tibor Sári <tiborsari@gmx.de>

RUN \
    apt-get update -qqy && \
    apt-get install --no-install-recommends -qqy \
        curl \
    && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV COMPOSER_CACHE_DIR=/cache

RUN curl -sS --insecure https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set up the application directory
VOLUME ["/app"]
WORKDIR /app

# Set up the command arguments
ENTRYPOINT ["composer", "--ansi"]
