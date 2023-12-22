#DATE=$(date '+%c')
DATE=$(date '+%F-%H:%M:%S')
R="\e[31m"
G="\e[32m"
N="\e[0m"
LOGFILE="/var/log/logs/$0-$DATE.log"
echo "This script started running at $DATE" &>> $LOGFILE

ID=$(id -u)
VALUE=mysql
if [ $ID -ne 0 ]
then
echo -e "$R Run the script with sudo access $N"
exit 1
fi
VALIDATE(){
    if [ $? -ne 0 ]
    then
    echo -e "$R $2 is failed to install $N"
    exit 1
    else
    echo -e "$G $2 is successfully completed $N"
    fi 
}
CHECK(){
    if [ $? -eq 0 ]
    then
    echo -e "$G $1 is already installed $N"
    exit 1
    fi 
}

yum list $VALUE &>> $LOGFILE
#CHECK $VALUE
yum install $VALUE -y &>> $LOGFILE
VALIDATE $? "installing $VALUE"