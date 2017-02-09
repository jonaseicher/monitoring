#!/bin/bash
docker stop prometheus
docker rm prometheus
docker build -t devops/prometheus .
docker run -p 9090:9090 --name prometheus -v prometheus:/prometheus -d --init devops/prometheus
docker logs prometheus
