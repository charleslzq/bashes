#!/usr/bin/env bash
source <(grep = config.ini)
collection=$1
month=$2
filepath=${dump_base_path}"\\"${collection}"\\"${month}
cd ${mongo_path}
./mongodump.exe --host ${mongo_host} --db ${db} --collection ${collection} --query {month:${month}} --out ${filepath}