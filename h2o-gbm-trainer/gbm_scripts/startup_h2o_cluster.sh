#!/bin/bash
# Copyright 2018 H2O.ai.
# SPDX-License-Identifier: Apache-2.0

memTotalKb=`cat /proc/meminfo | grep MemTotal | sed 's/MemTotal:[ \t]*//' | sed 's/ kB//'`
memTotalMb=$[ $memTotalKb / 1024 ]
tmp=$[ $memTotalMb * 70 ]
xmxMb=$[ $tmp / 100 ]

/usr/bin/java -Xmx${xmxMb}m -jar h2o.jar -name sagemakerCloud -flatfile flatfile.txt -network 10.0.0.0/8
