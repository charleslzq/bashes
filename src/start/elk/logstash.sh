#!/usr/bin/env bash

. ./config.sh

cd ${logstash_home}
./logstash.bat -f Logstash.conf
