#!/bin/bash
yum install mysql -y
if [ $? -nq 0 ]
then
    echo "command execution failed"
    exit 1
else
    echo "Command executed successfuly"
fi