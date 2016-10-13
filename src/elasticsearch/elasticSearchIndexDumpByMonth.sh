#!/usr/bin/env bash

. ./config.sh

index=$1
monthStr=$2
year=${monthStr:0:4}
month=${monthStr:4:2}
start=${year}"/"${month}"/01"
queryStr="{\"query\":{\"constant_score\":{\"filter\":{\"range\":{\"@timestamp\":{\"gte\":\""${start}"\",\"lt\":\""${start}"||+1M\"}}}}}}"

time=`date "+%Y-%m-%d %H:%M:%S"`
timestamp=`date -d "${time}" +%s`

outputfile=${dump_base_path}"\\"${monthStr}"\\"${index}"-"${timestamp}".json"


echo "dumping "${index}" in month "${monthStr}" output:"${outputfile}

elasticdump \
    --input=${elastic_search_url}"/"${index} \
    --searchBody ${queryStr} \
    --output=${outputfile}
#    --delete

if [ ! -s $outputfile ]
then
    rm -if ${outputfile}
fi
