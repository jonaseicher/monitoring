FROM node:boron
# -----------------------------------------------------------------------------
# Startup
# -----------------------------------------------------------------------------
#USER www-data

COPY helloworld.js /home/node/
COPY entrypoint.sh /entrypoint.sh
COPY node_exporter /bin/

RUN chmod +x /entrypoint.sh

EXPOSE 4000 9100

ENTRYPOINT /entrypoint.sh