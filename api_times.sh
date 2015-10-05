#!/bin/bash

for i in {1..5}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" http://127.0.0.1:8777/v2/meters/image?limit=100000 -o volume-100-$i.json) 2> volume-100-$i-time; done

sleep 10

for i in {1..5}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" http://127.0.0.1:8777/v2/meters/image?limit=250000 -o volume-250-$i.json) 2> volume-250-$i-time; done

sleep 10

for i in {1..5}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" http://127.0.0.1:8777/v2/meters/image?limit=500000 -o volume-500-$i.json) 2> volume-500-$i-time; done

sleep 10

for i in {1..5}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" http://127.0.0.1:8777/v2/meters/image?limit=750000 -o volume-750-$i.json) 2> volume-750-$i-time; done

sleep 10

for i in {1..5}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" http://127.0.0.1:8777/v2/meters/image?limit=1000000 -o volume-1M-$i.json) 2> volume-1M-$i-time; done

sleep 10

for i in {1..5}; do (time curl --max-time 3600 -X GET -H "Content-Type:application/json" http://127.0.0.1:8777/v2/meters/image?limit=2000000 -o volume-2M-$i.json) 2> volume-2M-$i-time; done
