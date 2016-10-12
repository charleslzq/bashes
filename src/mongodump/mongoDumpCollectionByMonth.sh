#!/usr/bin/env bash
source <(grep = config.ini)
collection=$1
month=$2
time=`date "+%Y-%m-%d %H:%M:%S"`
timestamp=`date -d "${time}" +%s`
filepath=${dump_base_path}"\\"${collection}"\\"${month}"\\"${timestamp}
cd ${mongo_path}
./mongodump.exe --host ${mongo_host} --db ${db} --collection ${collection} --query {month:${month}} --out ${filepath}