#!/bin/bash
ID=$( id -u )
if [ $ID -ne 0 ]
then
echo "retry script with sudo"
else
echo "script executes"
fi

VALIDATE(){
    if [ $? -eq 0]
    then
    echo "$1 Command executed"
    else
    echo "$1 Command execution failed"
}


for package in $@
do
echo "entered value $package"
VALIDATE
#yum install $package -y
done