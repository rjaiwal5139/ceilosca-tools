#!/bin/bash

for i in {1..10}; do (time monasca measurement-list instance 2015-10-17T00:00:00Z --dimensions project_id=002_tenant_abcdefgh --merge_metrics > instance-t2-mon-$i.json) 2> instance-t2-mon-$i.time; done

sleep 10

for i in {1..10}; do (time monasca measurement-list instance 2015-10-17T00:00:00Z --dimensions project_id=00102_tenant_abcdefgh --merge_metrics > instance-t102-mon-$i.json) 2> instance-t102-mon-$i.time; done

sleep 10

for i in {1..10}; do (time monasca measurement-list instance 2015-10-17T00:00:00Z --dimensions project_id=00202_tenant_abcdefgh --merge_metrics > instance-t202-mon-$i.json) 2> instance-t202-mon-$i.time; done

sleep 10

for i in {1..10}; do (time monasca measurement-list instance 2015-10-17T00:00:00Z --dimensions project_id=00302_tenant_abcdefgh --merge_metrics > instance-t302-mon-$i.json) 2> instance-t302-mon-$i.time; done

sleep 10

for i in {1..10}; do (time monasca measurement-list instance 2015-10-17T00:00:00Z --dimensions project_id=00402_tenant_abcdefgh --merge_metrics > instance-t402-mon-$i.json) 2> instance-t402-mon-$i.time; done
