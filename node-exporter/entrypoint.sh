#!/bin/sh

/bin/node_exporter &
exec node /home/node/helloworld.js
