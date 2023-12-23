#!/bin/bash
ID=$( id -u )
if [ $ID -ne 0 ]
then
echo "retry script with sudo"
else
echo "script executes"
fi

for package in $@
do
echo "entered value"
#yum install $package -y
done