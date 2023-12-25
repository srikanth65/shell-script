#!/bin/bash
ID=$(id -u)
if [ $ID -ne 0 ]
then
echo "run script with sudo permissions"
fi

SEARCH=$(find /home/centos/test -type f -name "*.log" -mtime -15)
echo "$SEARCH"