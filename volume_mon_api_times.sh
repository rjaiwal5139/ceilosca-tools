#!/bin/bash

for i in {1..10}; do (time monasca measurement-list volume 2015-10-17T00:00:00Z --dimensions project_id=001_tenant_abcdefgh --merge_metrics > volume-t1-mon-$i.json) 2> volume-t1-mon-$i.time; done

sleep 10

for i in {1..10}; do (time monasca measurement-list volume 2015-10-17T00:00:00Z --dimensions project_id=00101_tenant_abcdefgh --merge_metrics > volume-t101-mon-$i.json) 2> volume-t101-mon-$i.time; done

sleep 10

for i in {1..10}; do (time monasca measurement-list volume 2015-10-17T00:00:00Z --dimensions project_id=00201_tenant_abcdefgh --merge_metrics > volume-t201-mon-$i.json) 2> volume-t201-mon-$i.time; done

sleep 10

for i in {1..10}; do (time monasca measurement-list volume 2015-10-17T00:00:00Z --dimensions project_id=00301_tenant_abcdefgh --merge_metrics > volume-t301-mon-$i.json) 2> volume-t301-mon-$i.time; done

sleep 10

for i in {1..10}; do (time monasca measurement-list volume 2015-10-17T00:00:00Z --dimensions project_id=00401_tenant_abcdefgh --merge_metrics > volume-t401-mon-$i.json) 2> volume-t401-mon-$i.time; done
