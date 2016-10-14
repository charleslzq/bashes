#!/usr/bin/env bash
. config.sh
collection=$1
month=$2
time=`date "+%Y-%m-%d %H:%M:%S"`
timestamp=`date -d "${time}" +%s`
filepath=${dump_base_path}${path_separator}${collection}${path_separator}${month}${path_separator}${timestamp}
dumpfilepath=${filepath}${path_separator}"gateway"${path_separator}${collection}".bson"

echo ${time}": dumping "${collection}" in month "${month}" output:"${dumpfilepath}

cd ${mongo_path}
./mongodump.exe \
    --host ${mongo_host} \
    --db ${db} \
    --collection ${collection} \
    --query {month:${month}} \
    --out ${filepath}
if [ ! -s $dumpfilepath ]
then
    time=`date "+%Y-%m-%d %H:%M:%S"`
    echo ${time}": empty result, deleting "${filepath}
    rm -rf ${dump_base_path}${path_separator}${collection}${path_separator}${month}${path_separator}${timestamp}
else
    time=`date "+%Y-%m-%d %H:%M:%S"`
    orig_base=${filepath}${path_separator}${db}${path_separator}${collection}
    dest_base=${dump_base_path}${path_separator}${db}"_"${collection}"_"${month}"_"${timestamp}
    echo ${time}": Moving files "${orig_base}" to "${dest_base}
    mv \
    ${orig_base}".bson" \
    ${dest_base}".bson"
    mv \
    ${orig_base}".metadata.json" \
    ${dest_base}".metadata.json"
    rm -rf ${dump_base_path}${path_separator}${collection}${path_separator}${month}${path_separator}${timestamp}
    cd ${mongodump_home}
    ./mongoDeleteByMonth.sh ${collection} ${month}
fi