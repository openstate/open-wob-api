#!/usr/bin/env python

import sys
import json


def main():
    result = json.load(sys.stdin)
    excel_resources = [f for f in result[u'result'][u'resources'] if f[u'format'].startswith('XLS')]
    try:
        print excel_resources[0][u'url']
    except LookupError:
        return 1
    return 0

if __name__ == '__main__':
    sys.exit(main())
