#!/bin/bash
AMI="ami-03265a0778a880afb"
SECURITY="sg-0773d1c611d536265"
INSTANCE=("mongoDB" "redis" "mysql" "rabbitmq" "catalouge" "cart" "user" "shipping" "payments" "ratings")

for i in ${INSTANCE[@]}
do

    if [ $i == "rabbitmq" ] || [ $i == "mongoDB" ] || [ $i == "redis" ]
    then 
       INSTANCE_TYPE="t3.small"
    else 
        INSTANCE_TYPE="t2.micro"
    fi
   IP=$(aws ec2 run-instances --image-id $AMI --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].[PrivateIpAddress]' --output text)
        echo "ServerName: $i  Private_IP_Address: $IP"
done 