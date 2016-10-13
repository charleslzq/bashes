#!/usr/bin/env bash
set -e
. ./config.sh

if [ ! -d $log_base_path ]
then
    mkdir -p ${log_base_path}
fi

if [ ! -d $dump_base_path ]
then
    mkdir -p ${dump_base_path}
fi

month=$1
logpath=${log_base_path}"\\"${month}".log"

time=`date "+%Y-%m-%d %H:%M:%S"`
echo ${time}": Start to dump collections "${collections[@]} >> ${logpath}

for collection in ${collections[@]}
do
    ./mongoDumpCollectionByMonth.sh ${collection} ${month} >> ${logpath}
    ./mongoDeleteByMonth.sh ${collection} ${month} >> ${logpath}
done
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" >> ${logpath}