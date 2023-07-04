from php:7-apache

RUN \
    apt-get update && \
    apt-get install libldap2-dev -y && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap && \
    docker-php-ext-install mysqli && \
    docker-php-ext-enable mysqli

WORKDIR /var/www/html/
USER www-data
RUN curl -L -O https://downloads.sourceforge.net/project/mantisbt/mantis-stable/2.25.7/mantisbt-2.25.7.tar.gz && \ 
    tar xvf mantisbt*tar.gz && \
    mv -v mantisbt*/* ./

ADD config_inc.php /var/www/html/config/

ADD fpm-entrypoint.sh /fpm-entrypoint.sh

CMD ["/fpm-entrypoint.sh"]
