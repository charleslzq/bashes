#!/usr/bin/env bash

. ./config.sh

monthStr=$1
dirpath=${dump_base_path}"\\"${monthStr}
if [ ! -d $dirpath ]
then
    mkdir ${dirpath}
fi

for index in ${indexes[@]}
do
    ./elasticSearchIndexDumpByMonth.sh ${index} ${monthStr}
done

read -p "press any key to continue..."