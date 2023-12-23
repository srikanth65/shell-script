#!/bin/bash
ID=$( id -u )
DATE=$( date '+%F-%H:%M:%S' )
LOGFILE=/tmp/$0-$DATE.log
echo "$DATE"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $ID -ne 0 ]
then
echo "retry script with sudo"
else
echo "script executing...."
fi

VALIDATE(){
    if [ $? -eq 0 ]
    then
    echo -e " $G $1 Command executed $N"
    else
    echo -e "$G $1 Command execution failed $N"
    fi
}


for package in $@
do
    yum list $package &>> $LOGFILE
    if [ $? -ne 0 ]
    then
    yum install $package -y &>> $LOGFILE
    VALIDATE $package
    else 
    echo -e "$Y $package already exists $N" &>> $LOGFILE
    fi
#yum install $package -y
done