#!/usr/bin/env bash

. config.sh

cd ${mongo_home}
./mongod.exe --dbpath ${mongo_dbpath} --wiredTigerCacheSizeGB 1  --rest --profile 2 --slowms 1