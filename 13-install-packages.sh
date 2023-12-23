#!/bin/bash
ID=$( id -u )
DATE=${ date '+%F-%H:%M:%S' }
echo "$DATE"
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $ID -ne 0 ]
then
echo "retry script with sudo"
else
echo "script executes"
fi

VALIDATE(){
    if [ $? -eq 0 ]
    then
    echo "$1 Command executed"
    else
    echo "$1 Command execution failed"
    fi
}


for package in $@
do
echo "entered value $package"
VALIDATE $package
#yum install $package -y
done