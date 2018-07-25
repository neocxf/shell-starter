#!/usr/bin/env bash

echo "Please choose your options, by number: "

fruits=('apple' 'orange' 'banana')

select option in ${fruits[@]}
do
    case $option in
        apple )
            echo "You chose $option"
            break
            ;;
        orange )
            echo "you choose $option, great"
            ;;
        banana )
            echo "you choose $option, not good"
            ;;
        * )
            echo "please choose the right one"
            ;;
    esac
done