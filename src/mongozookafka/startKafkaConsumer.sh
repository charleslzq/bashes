#!/usr/bin/env bash
cd "D:\\software\\kafka_2.11-0.10.0.1\\bin\\windows"
./kafka-console-consumer.bat --zookeeper localhost:2181 --topic qy-logelk --from-beginning