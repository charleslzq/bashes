#!/usr/bin/env bash
. ./config.sh
collection=$1
month=$2
time=`date "+%Y-%m-%d %H:%M:%S"`
timestamp=`date -d "${time}" +%s`
filepath=${dump_base_path}${path_separator}${collection}${path_separator}${month}${path_separator}${timestamp}
dumpfilepath=${filepath}${path_separator}${db}${path_separator}${collection}".bson"

echo ${time}": dumping "${collection}" in month "${month}" output:"${dumpfilepath}

cd ${mongo_path}
./mongodump \
    --host ${mongo_host} \
    --db ${db} \
    --collection ${collection} \
    --query {month:${month}} \
    --out ${filepath}
if [ ! -s $dumpfilepath ]
then
    echo ${time}": empty result, deleting "${filepath}
    rm -rf ${dump_base_path}${path_separator}${collection}${path_separator}${month}${path_separator}${timestamp}
else
    cd ${dump_home}
    ./mongoDeleteByMonth.sh ${collection} ${month}
fi
