FROM php:8-cli-alpine
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN echo '0  *  *  *  *    php /usr/src/app/cf-update-ip ${EMAIL} $KEY $DOMAIN $SUBDOMAIN' > /etc/crontabs/root
RUN echo '*  *  *  *  *    date +"%T"' >> /etc/crontabs/root
CMD php /usr/src/app/cf-update-ip ${EMAIL} $KEY $DOMAIN $SUBDOMAIN && crond -f
