#!/bin/sh

source /opt/bin/activate
curl -XPOST 'http://elasticsearch:9200/owa_*/_delete_by_query?pretty' -d '{"query":{"match":{"id":"'$1'"}}}'
