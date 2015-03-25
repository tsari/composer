FROM debian:wheezy
RUN \
    apt-get update -qqy && \
    apt-get install --no-install-recommends -qqy \
        php5-cli \
        curl \
    && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sS --insecure https://getcomposer.org/installer | php

VOLUME ["/srv"]
WORKDIR /srv
RUN useradd composer
USER composer
ENTRYPOINT ["/composer.phar"]
