#!/usr/bin/env bash

n=1

while [ $n -le 10 ]; do
    echo "$n"

    (( n++ ))
#    n=$(( n+1 )) # works
#    n=$( n+1 ) # error
#    n=${(n + 1)} # error
done


while (( n < 12 )); do
    echo "$n"

    (( n++ ))

done


