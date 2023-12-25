#!/bin/bash

SOURCE_DIR=/home/centos/test1

if [ ! d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR source directory does not exists"
fi 



SEARCH=$(find /home/centos/test -type f -name "*.log" -mtime +10)
echo "$SEARCH"