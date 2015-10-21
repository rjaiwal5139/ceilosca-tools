#!/bin/bash

for i in {1..10}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" -d '{"q": [{"field": "timestamp", "op": "ge", "value": "2015-10-17T00:00:00"},{"field": "timestamp", "op": "le", "value": "2015-10-17T23:59:59"}, {"field": "project", "op": "eq", "value": "001_tenant_abcdefgh"}]}'  http://127.0.0.1:8777/v2/meters/volume -o volume-t1-$i.json) 2> volume-t1-$i-time; done

sleep 10

for i in {1..10}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" -d '{"q": [{"field": "timestamp", "op": "ge", "value": "2015-10-17T00:00:00"},{"field": "timestamp", "op": "le", "value": "2015-10-17T23:59:59"}, {"field": "project", "op": "eq", "value": "00101_tenant_abcdefgh"}]}'  http://127.0.0.1:8777/v2/meters/volume -o volume-t101-$i.json) 2> volume-t101-$i-time; done

sleep 10

for i in {1..10}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" -d '{"q": [{"field": "timestamp", "op": "ge", "value": "2015-10-17T00:00:00"},{"field": "timestamp", "op": "le", "value": "2015-10-17T23:59:59"}, {"field": "project", "op": "eq", "value": "00201_tenant_abcdefgh"}]}'  http://127.0.0.1:8777/v2/meters/volume -o volume-t201-$i.json) 2> volume-t201-$i-time; done

sleep 10

for i in {1..10}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" -d '{"q": [{"field": "timestamp", "op": "ge", "value": "2015-10-17T00:00:00"},{"field": "timestamp", "op": "le", "value": "2015-10-17T23:59:59"}, {"field": "project", "op": "eq", "value": "00301_tenant_abcdefgh"}]}'  http://127.0.0.1:8777/v2/meters/volume -o volume-t301-$i.json) 2> volume-t301-$i-time; done

sleep 10

for i in {1..10}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" -d '{"q": [{"field": "timestamp", "op": "ge", "value": "2015-10-17T00:00:00"},{"field": "timestamp", "op": "le", "value": "2015-10-17T23:59:59"}, {"field": "project", "op": "eq", "value": "00401_tenant_abcdefgh"}]}'  http://127.0.0.1:8777/v2/meters/volume -o volume-t401-$i.json) 2> volume-t401-$i-time; done
