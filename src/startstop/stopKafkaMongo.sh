#!/usr/bin/env bash

. ./config.sh

cd ${mongo_home}
./mongo.exe admin --eval "db.shutdownServer()"

cd ${kafka_home}
./kafka-server-stop.bat

#cd ${zookeeper_home}
#./zkServer.cmd stop