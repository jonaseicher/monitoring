#!/bin/bash

docker stop phantomas-exporter
docker rm phantomas-exporter
docker build -t devops/phantomas-exporter .
docker run -p 9149:9149 --name phantomas-exporter -d --init devops/phantomas-exporter
