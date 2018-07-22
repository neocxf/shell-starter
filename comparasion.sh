#! /bin/bash

a=3

if [ $a -eq 3 ]
then
    echo '3 eq 3'
fi

if [ $a -lt 5 ]
then
    echo '3 lt 5'
fi

if [ $a -gt 2 ]; then
    echo '3 gt 2'
fi

if [ $a -ne 2 ]; then
    echo '3 ne 2'
fi

if [ $a -le 3 ]; then
    echo '3 le 3'
fi

if [ $a -ge 3 ]; then
    echo '3 ge 3'
fi


if (($a < 4)); then
    echo '3 < 4'
fi

if (($a > 2)); then
    echo '3 > 2'
fi


if (($a >= 3)); then
    echo '3 >= 3'
fi

if (($a <= 3)); then
    echo '3 <= 3'
fi



