#!/usr/bin/env bash
while true; do
  mysql -uroot -proot -e "show processlist\G"| grep State |  sort -rn  | uniq >> mysql_process.log
#  every 100ms
  sleep 100000
done