FROM docker/dhi/php:8-alpine3.22-fips-dev
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN echo '0  *  *  *  *    php /usr/src/app/cf-update-ip ${EMAIL} $KEY $DOMAIN $SUBDOMAIN' > /etc/crontabs/root
CMD php /usr/src/app/cf-update-ip ${EMAIL} $KEY $DOMAIN $SUBDOMAIN && crond -f
