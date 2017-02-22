# Prometheus Server

This repository contains Dockerfiles, a docker-compose file and the configuration files needed to get started with Prometheus, Grafana and some Exporters. You can build it locally with docker-compose or in your openshift Orgspace with the respective build.yml files. Docker-compose works out-of-the-box. For Openshift PoCs, you need to make small adjustments to the configs. Ask us for help!

## Building the Docker images

With docker-compose, you can build a complete monitoring setup, consisting of:
- grafana (dashboard)
- prometheus (metrics scraper and database)
- node-exporter (metrics exporter)
- cadvisor (metrics exporter)
- Jenkins (exports metrics with Metrics and Prometheus Plugins*)
- Custom exporter (tiny node app, written by me) (metrics exporter) 

To build it, run the following command:
```
docker-compose build
```

To build only a specific image, i.e. the prometheus-server or grafana, cd in the respective directory and run
the following command:
```
docker build -t <name>:<tag> .
```

where `<name>` and `<tag>` are the image name and version tag you want to use.

## Running the Docker images

If you ran a `docker-compose build` successfully, run the following command:
```
docker-compose up
```
This will start all the containers and output the logs in your console.
The container ports are mapped to the host. Check the docker-compose.yaml for the host port mappings and change them, if you are using and of the for other apps.

The container volumes are automatically mapped to ~/docker/volumes/...

- Go to `http://localhost:9090` for prometheus
- Go to `http://localhost:3000` for grafana (credentials: admin, admin)
- Go to `http://localhost:9100/metrics` to see some node-exporter metrics in the prometheus format
- Go to `http://localhost:9080` `http://localhost:9080/metrics` for some cadvisor metrics
- Go to `http://localhost:9150/metrics` for some metrics from a custom exporter

