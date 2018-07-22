#! /bin/bash

echo -e "Enter the file name: \c"

read file_name

echo "file name is $file_name"

read  -sp  "Enter the password:\c"  password

echo

echo "password is ${password}"

read -p "Enter an array:\n" -a array

echo ${array[0]} ${array[1]}
