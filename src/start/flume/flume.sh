#!/usr/bin/env bash

. ./config.sh

cd ${FLUME_HOME}
bin/flume-ng.cmd agent --conf conf --conf-file conf/example.conf --name a1