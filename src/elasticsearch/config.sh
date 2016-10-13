#!/usr/bin/env bash

dump_base_path="d:\\dump\\elasticsearch"
elastic_search_url="http://localhost:9200"
dump_log_path="d:\\dumplog\\elasticsearch"

indexes=(\
    "ms-log" \
    "ms-adapter" \
)