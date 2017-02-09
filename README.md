# Prometheus Server

This repository contains definitions for building a Docker image for the
*Prometheus* monitoring system and time-series database, and for creating and
updating deployments of Prometheus on CRP.

The CI/CD pipeline is defined completely in the [Jenkinsfile](Jenkinsfile)
contained in this repository.


## Building the Docker image
To build the prometheus-server Docker image outside the Jenkins pipeline, run
the following command:
```
docker build -t <name>:<tag> .
```

where `<name>` and `<tag>` are the image name and version tag you want to use.

**Notes:**
- Since the image is based on the `crp/base` image, make sure you have access to
the CRP Docker registry in the environment you are running the Docker build in,
so the base image can be accessed.
-  The base image contains proxy settings that are required when doing the
Docker build in the ADP/CRP VMware environment. When using the Dockerfile in
another environment, adapt the setting accordingly by supplying different
`http_proxy` and `https_proxy` ENV variables.


## Running the Docker container
The Docker container exposes the following port which must be mapped on the
host:
- `9090` - the port of the Prometheus server UI and REST API

The following volumes can be mounted to the Docker container:
- `/prometheus` - this directory contains Prometheus' time-series data and
  meta-data

When starting the container on the command line, use the following command:
```
docker run -d --name prometheus-server -p 9090:9090 \
  -v /some/directory:/prometheus \
  <docker image name>:<docker image tag>
```
