#!/bin/bash

if [ $? -eq 0 ]
then
    echo "command executed successfuly"
else
    echo "Command execution failed"
fi
yum install mysql -y
if [ $? -eq 0 ]
then
    echo "command executed successfuly"
else
    echo "Command execution failed"
fi