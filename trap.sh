#!/usr/bin/env bash

trap "echo 'enter the kill signal, go to clear the resource'; cat process.pid; rm -f process.pid; exit 0 " 0 2 9 15

echo "current process is $$"

echo $$ > process.pid

for (( i=0; i<10; i++))
do
    echo "the $i process, go to work 10 secs"
    sleep 10

done

exit 0
