#!/usr/bin/env bash
. ./config.sh
collection=$1
month=$2
time=`date "+%Y-%m-%d %H:%M:%S"`
timestamp=`date -d "${time}" +%s`
filepath=${dump_base_path}"\\"${collection}"\\"${month}"\\"${timestamp}
logpath=${filepath}"\\gateway\\"${collection}".bson"
cd ${mongo_path}
./mongodump.exe \
    --host ${mongo_host} \
    --db ${db} \
    --collection ${collection} \
    --query {month:${month}} \
    --out ${filepath}
if [ ! -s $logpath ]
then
    rm -rf ${dump_base_path}"\\"${collection}"\\"${month}"\\"${timestamp}
fi