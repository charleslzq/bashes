#!/usr/bin/env bash
. ./config.sh
collection=$1
month=$2
time=`date "+%Y-%m-%d %H:%M:%S"`
echo ${time}" try to delete "${collection}" in month "${month}
cd ${mongo_path}
./mongo.exe ${db} --eval "db.getCollection(\"${collection}\").remove({month:${month}})"