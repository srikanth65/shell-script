#!/bin/bash
ID=$(id -u)
if [ $ID -ne 0 ]
then
    echo "Please run script with sudo access"
    exit 1
fi

yum list mysql > /dev/null
if [ $? -eq 0 ]
then
    echo "Already installed mysql"
    exit 1
else 
    yum install mysql -y
fi
if [ $? -ne 0 ]
then
    echo "command execution failed"
    exit 1
else
    echo "Command executed successfuly"
fi