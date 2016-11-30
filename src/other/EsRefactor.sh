#!/usr/bin/env bash

curl -XPOST 'localhost:9200/ms-log/logs/AVhhXC3TrzJmLx5aVT_a/_update' -d '{
    "script":{
        "file":"EsDataRefactor",
        "lang":"groovy"
    }
}'