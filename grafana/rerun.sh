#!/bin/bash

docker stop grafana
docker rm grafana
docker build -t devops/grafana .
docker run -p 3000:3000 --name grafana --init -d devops/grafana
