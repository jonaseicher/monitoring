FROM centos:7
#FROM registry.apps.os-test.adp.allianz/atc/base:latest

ENV PROMETHEUS_SERVER_VERSION=1.3.1

# so we know which tagged version of prometheus-server was used to build the image
LABEL prometheus_server_version=${PROMETHEUS_SERVER_VERSION}

RUN yum update -y \
  && yum install -y tar \
  && yum clean -y all \
  && export VER=$PROMETHEUS_SERVER_VERSION \
  && curl -LO https://github.com/prometheus/prometheus/releases/download/v${VER}/prometheus-${VER}.linux-amd64.tar.gz \
  && tar -xzf prometheus-${VER}.linux-amd64.tar.gz \
  && rm -f prometheus-${VER}.linux-amd64.tar.gz \
  && mv /prometheus-${VER}.linux-amd64 /opt/prometheus \
  && mkdir /prometheus \
  && mkdir -p /etc/prometheus \
  && cp /opt/prometheus/prometheus.yml /etc/prometheus/


# taken from https://hub.docker.com/r/prom/prometheus/~/dockerfile/
EXPOSE 9090
VOLUME [ "/prometheus", "/etc/prometheus" ]
WORKDIR /prometheus
ENTRYPOINT [ "/opt/prometheus/prometheus" ]
CMD [ "-config.file=/etc/prometheus/prometheus.yml", \
    "-storage.local.path=/prometheus", \
    "-web.console.libraries=/etc/prometheus/console_libraries", \
    "-web.console.templates=/etc/prometheus/consoles" ]

COPY prometheus.yml /etc/prometheus/prometheus.yml
