#!/bin/bash
AMI="ami-03265a0778a880afb"
SECURITY="sg-0773d1c611d536265"
INSTANCE=("mongoDB" "redis" "mysql" "rabbitmq" "catalouge" "cart" "user" "shipping" "payments" "ratings")

for i in ${INSTANCE[@]}
do

    if [ $i == rabbitmq ]
    then 
       IP=$(aws ec2 run-instances --image-id $AMI --instance-type t2.micro --security-group-ids $SECURITY --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].[PrivateIpAddress]' --output text)
       echo "$i:$IP"
    fi
    #echo "$i:$IP"
done 