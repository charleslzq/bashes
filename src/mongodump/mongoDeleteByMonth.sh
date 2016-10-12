#!/usr/bin/env bash
. ./config.sh
collection=$1
month=$2
cd ${mongo_path}
./mongo.exe ${db} --eval "db.getCollection(\"${collection}\").remove({month:${month}})"