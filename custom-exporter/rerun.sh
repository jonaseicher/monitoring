#!/bin/bash

docker stop custom-exporter
docker rm custom-exporter
docker build -t devops/custom-exporter .
docker run -p 9150:9150 --name custom-exporter -d --init devops/custom-exporter
