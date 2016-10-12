#!/usr/bin/env bash
source <(grep = config.ini)
month=$1
echo ${collections[@]}
for collection in ${collections[@]}
do
    ./mongoDumpCollectionByMonth.sh ${collection} ${month}
done
read -p "press any key to continue"