#! /bin/bash

echo -e "Enter the file name: \c"

read file_name

if (( -f file_name && -w file_name)); then
    echo "file exists and have write permissions"
else
    echo "file not exists or doesn't have write permissions"
fi

if [ -f $file_name ] && [ -w $file_name ]; then # and op 1
    echo "file exists and have write permissions"
else
    echo "file not exists or doesn't have write permissions"
fi

if [ -f $file_name -a -w $file_name ]; then  # and op 2
    echo "file exists and have write permissions"
else
    echo "file not exists or doesn't have write permissions"
fi

if [[ -f $file_name && -w $file_name ]]; then  # and op 3
    echo "file exists and have write permissions"
else
    echo "file not exists or doesn't have write permissions"
fi

if [ -f $file_name ] || [ -w $file_name ]; then # or op 1
    echo "file exists or have write permissions"
else
    echo "file not exists or doesn't have write permissions"
fi

if [ -f $file_name -o -w $file_name ]; then  # or op 2
    echo "file exists or have write permissions"
else
    echo "file not exists or doesn't have write permissions"
fi

if [[ -f $file_name || -w $file_name ]]; then  # or op 3
    echo "file exists or have write permissions"
else
    echo "file not exists or doesn't have write permissions"
fi

a=5

if [ $a -lt 8 ] && [ $a -gt 4 ]; then
    echo 'found'
else
    echo 'not found'
fi

if [ $a -lt 8  -a $a -gt 4 ]; then
    echo 'found'
else
    echo 'not found'
fi

if [[ $a -lt 8  && $a -gt 4 ]]; then
    echo 'found'
else
    echo 'not found'
fi

if [ -f $file_name ]; then
    if [ -w $file_name ]; then
        echo "Type some data. To quit, you need to use ctrl+d"
        cat >> $file_name
    else
        echo "the $file_name doesn't have write permissions"
    fi
else
    echo "$file_name not exists"
fi



