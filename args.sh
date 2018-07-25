#! /bin/bash

args=$@
# args=("$@")
echo $args
echo $@
echo ${args[0]} ${args[1]} ${args[2]}

if [  ! -z "$2" ]; then
    echo "$2 exists"
else
    echo "not exists 2"
fi

result=$(ls -al)

echo "$result"