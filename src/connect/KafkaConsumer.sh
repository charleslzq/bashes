#!/usr/bin/env bash

. ../start/zookafkamongo/config.sh

cd ${kafka_home}
./kafka-console-consumer.bat --zookeeper localhost:2181 --topic qy-logelk