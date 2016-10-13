#!/usr/bin/env bash

./startMongoDb.sh &

./startZoo.sh &

./startKafka.sh