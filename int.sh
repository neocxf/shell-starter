#! /bin/bash

int1=3
int2=2

# echo ${int1 + int2}  # error
# echo $( int1 + int2 ) #  error

echo $(( int1 + int2 ))
echo $(( int1 - int2 ))
echo $(( int1 * int2 ))
echo $(( int1 / int2 ))
echo $(( int1 % int2 ))

echo $(expr $int1 + $int2)
echo $(expr $int1 \* $int2)

