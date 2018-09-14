#!/usr/bin/env bash

function hello() {
    name=$1
    echo "$name"
}

hello2() {
    local name2=$1
    echo "$name2"
}

hello "world"

hello2 "world2"

echo "$name"

name2="world2-outside"

echo "$name2"






