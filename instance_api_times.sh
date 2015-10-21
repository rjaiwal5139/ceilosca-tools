#!/bin/bash

for i in {1..10}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" -d '{"q": [{"field": "timestamp", "op": "ge", "value": "2015-10-17T00:00:00"},{"field": "timestamp", "op": "le", "value": "2015-10-17T23:59:59"}, {"field": "project", "op": "eq", "value": "002_tenant_abcdefgh"}]}'  http://127.0.0.1:8777/v2/meters/instance -o instance-t2-$i.json) 2> instance-t2-$i-time; done

sleep 10

for i in {1..10}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" -d '{"q": [{"field": "timestamp", "op": "ge", "value": "2015-10-17T00:00:00"},{"field": "timestamp", "op": "le", "value": "2015-10-17T23:59:59"}, {"field": "project", "op": "eq", "value": "00102_tenant_abcdefgh"}]}'  http://127.0.0.1:8777/v2/meters/instance -o instance-t102-$i.json) 2> instance-t102-$i-time; done

sleep 10

for i in {1..10}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" -d '{"q": [{"field": "timestamp", "op": "ge", "value": "2015-10-17T00:00:00"},{"field": "timestamp", "op": "le", "value": "2015-10-17T23:59:59"}, {"field": "project", "op": "eq", "value": "00202_tenant_abcdefgh"}]}'  http://127.0.0.1:8777/v2/meters/instance -o instance-t202-$i.json) 2> instance-t202-$i-time; done

sleep 10

for i in {1..10}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" -d '{"q": [{"field": "timestamp", "op": "ge", "value": "2015-10-17T00:00:00"},{"field": "timestamp", "op": "le", "value": "2015-10-17T23:59:59"}, {"field": "project", "op": "eq", "value": "00302_tenant_abcdefgh"}]}'  http://127.0.0.1:8777/v2/meters/instance -o instance-t302-$i.json) 2> instance-t302-$i-time; done

sleep 10

for i in {1..10}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" -d '{"q": [{"field": "timestamp", "op": "ge", "value": "2015-10-17T00:00:00"},{"field": "timestamp", "op": "le", "value": "2015-10-17T23:59:59"}, {"field": "project", "op": "eq", "value": "00402_tenant_abcdefgh"}]}'  http://127.0.0.1:8777/v2/meters/instance -o instance-t402-$i.json) 2> instance-t402-$i-time; done
