#!/bin/bash

prefix="2020_04_20:hotnews:ids"
for i in `seq 1 1000000`
do
	elements="uuid-"${i}
  #	 $i 前面加上 10# 的意思是转换为十进制的形式，这样不会出现数据过大
	if [[ $((10#$i%2)) == 0 ]];then
		printf "set ${prefix}:${i} ${elements}\r\n"
	fi
done  > redis_commands.txt

#https://www.runoob.com/linux/linux-shell-array.html
# 下面这一段，我们实际是将redis-commands转换为 redis 使用的 protocol
while read CMD; do
  # each command begins with *{number arguments in command}\r\n
  XS=($CMD); printf "*${#XS[@]}\r\n"
  # for each argument, we append ${length}\r\n{argument}\r\n
  for X in $CMD; do printf "\$${#X}\r\n$X\r\n"; done
done < redis_commands.txt
