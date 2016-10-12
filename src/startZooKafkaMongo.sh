#!/usr/bin/env bash

./startMongo.sh &

./startZookeeper.sh &

./startKafka.sh &