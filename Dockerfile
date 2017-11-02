FROM openjdk:8u121-jdk-alpine

# 作成者情報
MAINTAINER toshi <toshi@toshi.click>

ENV DRIVER_URL http://search.maven.org/remotecontent?filepath=org/postgresql/postgresql/42.1.1.jre7/postgresql-42.1.1.jre7.jar
ENV APP_URL https://github.com/schemaspy/schemaspy/releases/download/v6.0.0-rc1/schemaspy-6.0.0-rc1.jar

WORKDIR /
RUN apk --update add graphviz ttf-dejavu postgresql-client postgresql-dev && \
    apk --update add --virtual .builddep tzdata wget libressl && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    wget -O postgres-connector-java.jar ${DRIVER_URL} && \
    wget -O schemaspy.jar ${APP_URL} && \
    apk del .builddep && \
rm -rf /var/cache/apk/*
