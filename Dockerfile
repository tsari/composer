FROM tsari/wheezy-apache-php
MAINTAINER Tibor Sári <tiborsari@gmx.de>

RUN \
    apt-get update -qqy && \
    apt-get install --no-install-recommends -qqy \
        curl \
    && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -ms /bin/bash composer
RUN mkdir /home/composer/bin

RUN curl -sS --insecure https://getcomposer.org/installer | php -- --install-dir=/home/composer/bin --filename=composer

RUN chown -R composer.composer /home/composer
USER composer
ENV HOME /home/composer

ENV PATH=/home/composer/bin/:$PATH

# Set up the application directory
VOLUME ["/app"]
WORKDIR /app

# Set up the command arguments
ENTRYPOINT ["composer", "--ansi"]