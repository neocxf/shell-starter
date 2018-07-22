#! /bin/bash

echo -e "Enter the file name: \c"

read file_name

if [ -e $file_name ]; then
    echo "$file_name found"
else
    echo "$file_name not found"
fi

if [ -f $file_name ]; then
    echo "$file_name is a regular file"
else
    echo "$file_name is not a regular file"
fi

if [ -d $file_name ]; then
    echo "$file_name is a directory"
else
    echo "$file_name is not a directory"
fi

if [ -b $file_name ]; then
    echo "$file_name is a blob file"
else
    echo "$file_name is not a blob file"
fi

if [ -c $file_name ]; then
    echo "$file_name is a character file"
else
    echo "$file_name is not a character file"
fi

if [ -s $file_name ]; then  # non-empty file
    echo "$file_name is not a empty file"
else
    echo "$file_name is a empty file"
fi

if [ -x $file_name ]; then
    echo "$file_name is executable file"
else
    echo "$file_name is not an executable file"
fi

if [ -w $file_name ]; then
    echo "$file_name is writable file"
else
    echo "$file_name is not an writable file"
fi

if [ -r $file_name ]; then
    echo "$file_name is readable file"
else
    echo "$file_name is not a readable file"
fi