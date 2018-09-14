#!/usr/bin/env bash

usage() {
    echo "please at least provide one parameter:"
    echo "$0 file_name"
    exit 0
}

file_exists() {
    if [ -f $1 ]; then
        echo "file $1 exists"
    else
        echo "file $1 not exists"
    fi
}

(( $#==0)) && usage

file_exists $1

