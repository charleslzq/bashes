#!/usr/bin/env bash
collection=$1
month=$2
filepath="d:\\mongo\\data\\dump\\"${collection}"\\"${month}
cd "C:\\Program Files\\MongoDB\\Server\\3.2\\bin"
./mongodump.exe --host "localhost:27017" --db gateway --collection ${collection} --query {month:${month}} --out ${filepath}