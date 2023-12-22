#!/bin/bash
ID=$(id -u)
if [ $ID -ne 0 ]
then
    echo "Please run script with sudo access"
fi
yum install mysql -y
if [ $? -ne 0 ]
then
    echo "command execution failed"
    exit 1
else
    echo "Command executed successfuly"
fi