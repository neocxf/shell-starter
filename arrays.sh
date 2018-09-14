#!/usr/bin/env bash

os=('windows', 'mac')

echo "array is ${os[@]}"

echo "index of array is ${!os[@]}"

echo "total number of array is ${#os[@]}"

echo "${os[0]} ${os[1]}"

os[3]='ubuntu'

echo "array is ${os[@]}"

unset os[3]

echo "array is ${os[@]}"

str=sfsdfafdsafdsa

echo "${str[@]}"
echo "${str[0]}"
echo "${str[1]}"