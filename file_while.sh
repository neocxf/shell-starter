#!/usr/bin/env bash

read -p "Enter the file that you want to echo: " file_name

if [ ! -f $file_name ]; then
    echo "the file $file_name you enter doesn't exists"
    exit 0
fi

echo "use file redirection to echo the content"

while read p; do
    echo $p
done < $file_name

echo "use pipe to echo the content"

cat $file_name | while read p; do
    echo $p
done