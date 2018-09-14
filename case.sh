#!/usr/bin/env bash

vehicle=$1

case $vehicle in

    "car" )
        echo "Rent of $vehicle is 150$" ;;
    "trunk" )
        echo "Rent of $vehicle is 100$" ;;
    "bicycle" )
        echo "Rent of $vehicle is 5$" ;;
    [a-z]* )
        echo "you input [a-z] match" ;;
    * )
        echo "unknown bicycle" ;;
esac