#!/usr/bin/env bash

curl -XPOST 'localhost:9200/ms-log/_update_by_query?conficts=proceed' -d'{
    "script":{
        "file":"EsDataRefactor",
        "lang":"groovy"
    },
     "query":{
         "bool":{
             "filter":[
                 {
                     "range": {
                            "@timestamp":{
                                "gt":"now-1d/d",
                                "lte":"now/d"
                            }
                        }
                },
                {
                    "match":{
                        "message":"*execution*"
                    }
                }
             ]
         }
    }
}'