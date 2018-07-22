#! /bin/bash

a=abc

if [ $a == "abc" ]; then
    echo 'abc == abc'
fi


if [ $a = "abc" ]; then
    echo 'abc = abc'
fi


if [ $a != "abcd" ]; then
    echo 'abc != abcd'
fi

if [ $a = "abc" ]; then
    echo 'abc = abc'
fi


if [[ $a < "bcd" ]]; then # should contains two [[]] if compared with alphaletic order
    echo 'abc < bcd'
fi


if [[ $a > "bcd" ]]; then
    echo 'abc > bcd'
fi

if [[ -z $b ]]; then
    echo '$b is undefined'
fi



