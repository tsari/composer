FROM tsari/jessie-apache2-php
MAINTAINER Tibor Sári <tiborsari@gmx.de>

ENV COMPOSER_VERSION 1.1.0

RUN curl -S --insecure -o /usr/local/bin/composer https://getcomposer.org/download/$COMPOSER_VERSION/composer.phar
RUN chmod +x /usr/local/bin/composer
#RUN curl -sS --insecure https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set up the application directory
VOLUME ["/app"]
WORKDIR /app

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set up the command arguments
ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "composer", "--ansi"]