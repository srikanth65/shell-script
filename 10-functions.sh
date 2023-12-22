ID=$(id -u)
VALUE=mysql
if [ $ID -ne 0 ]
then
echo "Run the script with sudo access"
exit 1
fi
VALIDATE(){
    if [ $? -ne 0 ]
    then
    echo "$2 is failed to install"
    exit 1
    else
    echo "$2 is successfully completed"
    fi 
}
CHECK(){
    if [ $? -eq 0 ]
    then
    echo "$1 is already installed"
    exit 1
    fi 
}

yum list $VALUE > /dev/null
#CHECK $VALUE
yum install $VALUE -y
VALIDATE $? "installing $VALUE"