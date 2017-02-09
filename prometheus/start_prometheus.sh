#!/bin/bash
# script to start prometheus server

# The data directory at /prometheus is mounted from a persistent volume so data
# is kept across container re-creation.
# Check if data directory has been initialized before (by a previous container
# instance). If not, wipe it to have a clean state and prevent startup failures.
if [ -e /prometheus/VERSION ]; then
  echo "/prometheus data directory is initialized."
else
  echo "/prometheus data directory not initialized. Wiping."
  rm -rf /prometheus/*
fi

# fix no_proxy setting
export no_proxy=$no_proxy,.cluster.local

# start
/opt/prometheus/prometheus \
  -config.file=/etc/prometheus/prometheus.yml \
  -storage.local.path=/prometheus \
  -web.console.libraries=/opt/prometheus/console_libraries \
  -web.console.templates=/opt/prometheus/consoles \
  -log.level=debug \
  -alertmanager.url=http://prometheus-alertmanager.monitoring.svc.cluster.local:9093/
