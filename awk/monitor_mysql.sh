#!/bin/bash

awk '{print $0}' demo.txt
awk '{printf ("%s\n", $0)}' demo.txt
awk '{print $1}' demo.txt
awk '/n/{print $1}' demo.txt

mysqladmin -uroot ext -proot | awk '/Queries/{printf("%s ", $4)}/Threads_connected/{printf("%s ", $4)}/Threads_running/{printf("%s \n", $4)}'
mysqladmin -uroot ext -proot | awk '/Queries/{q=$4}/Threads_connected/{c=$4}/Threads_running/{r=$4}END{printf("%d %d %d \n", q, c, r)}'
mysqladmin -uroot ext -proot | awk  -v date="$(date +'%Y-%m-%d %r')" '/Queries/{q=$4}/Threads_connected/{c=$4}/Threads_running/{r=$4}END{printf("%s: %d %d %d \n", date, q, c, r)}'

while true; do
  mysqladmin -uroot ext -proot | awk  '/Queries/{q=$4}/Threads_connected/{c=$4}/Threads_running/{r=$4}END{printf("%d %d %d \n", q, c, r)}' >> mysql_status.log
  sleep 1
done

# 统计出log中每秒的信息
awk '{q=$1-last;last=$1}{printf("%d\t%d\t%d \n", q, $2, $3)}' mysql_status.log
