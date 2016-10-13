#!/usr/bin/env bash

set -e

. ./config.sh

if [ ! -d $dump_base_path ]
then
    mkdir -p ${dump_base_path}
fi

if [ ! -d $dump_log_path ]
then
    mkdir -p ${dump_log_path}
fi

monthStr=$1
dirpath=${dump_base_path}"\\"${monthStr}
if [ ! -d $dirpath ]
then
    mkdir ${dirpath}
fi

logfile=${dump_log_path}"\\"${monthStr}".log"

echo "Start to dump indexes: "${indexes[@]} >> ${logfile}

for index in ${indexes[@]}
do
    ./elasticSearchIndexDumpByMonth.sh ${index} ${monthStr} >> ${logfile}
done