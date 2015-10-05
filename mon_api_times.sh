#!/bin/bash

for i in {1..5}; do (time monasca measurement-list image 1970-01-01T00:00:00Z --limit 100000 --merge_metrics > image-100-mon-$i.json) 2> image-100-mon-$i.time; done

sleep 10

for i in {1..5}; do (time monasca measurement-list image 1970-01-01T00:00:00Z --limit 250000 --merge_metrics > image-250-mon-$i.json) 2> image-250-mon-$i.time; done

sleep 10

for i in {1..5}; do (time monasca measurement-list image 1970-01-01T00:00:00Z --limit 500000 --merge_metrics > image-500-mon-$i.json) 2> image-500-mon-$i.time; done

sleep 10

for i in {1..5}; do (time monasca measurement-list image 1970-01-01T00:00:00Z --limit 750000 --merge_metrics > image-750-mon-$i.json) 2> image-750-mon-$i.time; done

sleep 10

for i in {1..5}; do (time monasca measurement-list image 1970-01-01T00:00:00Z --limit 1000000 --merge_metrics > image-1M-mon-$i.json) 2> image-1M-mon-$i.time; done

sleep 10

for i in {1..5}; do (time monasca measurement-list image 1970-01-01T00:00:00Z --limit 2000000 --merge_metrics > image-2M-mon-$i.json) 2> image-2M-mon-$i.time; done
