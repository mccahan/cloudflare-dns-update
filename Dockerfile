FROM cgr.dev/chainguard/php:latest-dev
COPY . /app
WORKDIR /app
USER root
CMD php /app/cf-update-ip ${EMAIL} $KEY $DOMAIN $SUBDOMAIN && while true; do sleep 3600 && php /app/cf-update-ip ${EMAIL} $KEY $DOMAIN $SUBDOMAIN; done
