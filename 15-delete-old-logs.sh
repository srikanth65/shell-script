#!/bin/bash

SOURCE_DIR=/home/centos/test

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$SOURCE_DIR is doesn't exist"
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -name "*.log" -mtime +12)

WHILE IFS= read -r line
do
echo "Deleting $line"
rm -rf $line

done <<<$FILES_TO_DELETE