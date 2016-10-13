#!/usr/bin/env bash

. ./config.sh

cd ${mongo_home}
./mongod.exe --dbpath ${mongo_dbpath}