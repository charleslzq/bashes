#!/usr/bin/env bash
collections=(\
    "qy-logelk-ms-log" \
    "test" \
    "ms-adapter" \
    "qy-logelk-ms-adapter" \
)
mongo_host="localhost:27017"
mongo_path="d:\\software\\mongo\\bin"
mongodump_home="C:\Users\Administrator\IdeaProjects\bash\src\mongodump\windows"
dump_base_path="d:\\dump\\mongo"
log_base_path="d:\\dumplog\\mongo"
db="gateway"

path_separator="\\"