#!/bin/sh

# -c：在空环境中执行指定的命令。
exec -c ls

# redirect all the input to the file
exec 1>file
