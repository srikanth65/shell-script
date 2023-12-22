ID=$(id -u)
if [ $ID -ne 0 ]
then
echo "Run the script with sudo access"
exit 1
fi
VALIDATE(){
    if [ $? -ne 0 ]
    then
    echo "$1 is failed to install"
    exit 1
    else
    echo "$1 is successfully installed"
    fi 
}
CHECK(){
    if [ $? -eq 0 ]
    then
    echo "$1 is already installed"
    exit 1
    fi 
}

yum list mysql 
CHECK
yum install mysql -y
VALIDATE $? "installing mysql"