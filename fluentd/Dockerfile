FROM fluent/fluentd:v1.16-1

USER root

RUN apk add --no-cache --virtual .build-deps \
    build-base \
    ruby-dev \
    tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone && \
    apk add --no-cache \
    mariadb-dev && \
    gem install fluent-plugin-mysql --no-document && \
    apk del .build-deps

USER fluent
