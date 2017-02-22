FROM centos:7
# -----------------------------------------------------------------------------
# Startup
# -----------------------------------------------------------------------------
#USER www-data

COPY node_exporter /bin/

EXPOSE 9100

ENTRYPOINT /bin/node_exporter
