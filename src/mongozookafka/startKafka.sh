#!/usr/bin/env bash

. ./config.sh

cd ${kafka_home}
./kafka-server-start.bat "..\\..\\config\\server.properties"                           