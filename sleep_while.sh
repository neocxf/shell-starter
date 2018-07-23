#!/usr/bin/env bash

n=1

while [ $n -le 10 ]; do
    echo "$n"

    (( n++ ))

    sleep 1
done

while (( n < 12)); do
    echo "$n"
    gnome-terminal &
    (( n++ ))
done

