cd data/

curl -O https://download.elastic.co/demos/kibana/gettingstarted/shakespeare_6.0.json

curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/shakespeare/doc/_bulk?pretty' --data-binary @shakespeare_6.0.json

cd -