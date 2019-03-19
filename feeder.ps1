[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Set-Location data/

Invoke-WebRequest -Uri https://download.elastic.co/demos/kibana/gettingstarted/shakespeare_6.0.json -OutFile shakespeare_6.0.json

Invoke-RestMethod "http://localhost:9200/shakespeare/doc/_bulk?pretty" -Method Post -ContentType 'application/x-ndjson' -InFile "shakespeare_6.0.json"


