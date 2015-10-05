from datetime import datetime, timedelta
import multiprocessing
import sys
import time
import argparse

from monascaclient import client
from monascaclient import ksclient

endpoint = "http://127.0.0.1:8070/v2.0"
auth_url = "http://127.0.0.1:35357/v3/"


def mon_client(username, password, auth_url, endpoint, tenant_name):

    kwargs = {
        'username': username,
        'password': password,
        'auth_url': auth_url,
        'project_name': tenant_name,
    }

    _ksclient = ksclient.KSClient(**kwargs)
    kwargs = {'token': _ksclient.token}
    api_version = '2_0'
    return client.Client(api_version, endpoint, **kwargs)

c = mon_client("ceilometer", "password", auth_url, endpoint, "service")
m = c.metrics


def doWork(metric_name, start_ts, end_ts, limit):
    data = getResults(metric_name, start_ts, end_ts, limit)
    doSomethingWithResult(data)


def getResults(metric_name, start_ts, end_ts, limit):
    try:
        if limit:
            samples = m.list_measurements(name=metric_name,
                                          start_time=start_ts.isoformat(),
                                          end_time=end_ts.isoformat(),
                                          merge_metrics=True,
                                          limit=limit
                                          )
        else:
            samples = m.list_measurements(name=metric_name,
                                          start_time=start_ts.isoformat(),
                                          end_time=end_ts.isoformat(),
                                          merge_metrics=True
                                          )

        return samples

    except Exception as ex:
        print ex
        return "error"


def doSomethingWithResult(data):
    if data:
        print data


def perdelta(start, end, delta_type='day'):

    if delta_type == 'day':
        delta = timedelta(days=1)
    if delta_type == 'hour':
        delta = timedelta(hours=1)
    if delta_type == 'minute':
        delta = timedelta(minutes=1)
    if delta_type == 'second':
        delta = timedelta(seconds=1)

    curr = start
    while curr < end:
        next = curr + delta
        yield (curr, next)
        curr = next


def main():

    parser = argparse.ArgumentParser()

    parser.add_argument(
        '--start',
        dest='start_ts',
        type=str,
        default='1970-01-01'
    )

    parser.add_argument(
        '--end',
        dest='end_ts',
        type=str,
        default=time.strftime("%Y-%m-%d")
    )

    parser.add_argument(
        '--metric-name',
        dest='metric_name',
        type=str,
        default='volume'
    )

    parser.add_argument(
        '--delta',
        dest='delta_type',
        type=str,
        default='day'
    )

    parser.add_argument(
        '--limit',
        dest='limit',
        type=int,
        default=None
    )

    args = parser.parse_args()
    process_list = []
    print args.start_ts
    print args.end_ts

    start_ts = datetime.strptime(args.start_ts, '%Y-%m-%d')
    end_ts = datetime.strptime(args.end_ts, '%Y-%m-%d')

    delta = end_ts - start_ts
    print delta.days

    for start, end in perdelta(start_ts, end_ts, args.delta_type):
        p = multiprocessing.Process(target=doWork, args=(args.metric_name, start, end, args.limit))
        process_list.append(p)
        p.start()

    try:
        for p in process_list:
            try:
                p.join()
            except Exception:
                pass

    except KeyboardInterrupt:
        sys.exit(1)

if __name__ == '__main__':
    main()
