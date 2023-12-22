#!/bin/bash
VALUE1=$1
VALUE2=$2
if [ $VALUE1 -gt $VALUE2 ]
then
    echo "$VALUE1 is greater than $VALUE2"
else
    echo "$VALUE2 is greater than $VALUE1"
fi
