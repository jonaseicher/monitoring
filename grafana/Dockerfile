FROM centos:7
#FROM registry.apps.os-test.adp.allianz/atc/base

MAINTAINER Jonas Eicher <jonas.eicher@kite-consult.de>

ENV GRAFANA_VERSION 4.1.1-1484211277

RUN yum update -y \
    && yum install -y wget \
    && wget http://grafanarel.s3.amazonaws.com/builds/grafana-${GRAFANA_VERSION}.linux-x64.tar.gz -O grafana.tar.gz \
    && tar zxf grafana.tar.gz \
    && rm -f grafana.tar.gz \
    && rm -rf app \
    && mv grafana-${GRAFANA_VERSION} app \
    && yum autoremove -y \
    && yum clean all \
    && chgrp -R 0 /app \
    && chmod -R g+rw /app \
    && find /app -type d -exec chmod g+x {} +

WORKDIR /app

RUN sed -i 's/console file/console/g' /app/conf/defaults.ini;

COPY run.sh /run.sh

RUN chmod +x /run.sh

VOLUME ["/app/data"]

EXPOSE 3000

ENTRYPOINT ["/app/bin/grafana-server"]
