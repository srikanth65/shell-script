#!/bin/bash
AMI="ami-03265a0778a880afb"
SECURITY="sg-0773d1c611d536265"
INSTANCE=("mongoDB" "redis" "mysql" "rabbitmq" "catalouge" "cart" "user" "shipping" "payments" "ratings")

for i in ${INSTANCE[@]}
do
    echo "$i"
    if [ $i == redis ]
    then 
      IP=$(aws ec2 run-instances --image-id $AMI --instance-type t2.micro \ 
        --security-group-ids $SECURITY --tags Key=Name,Value=$i #\
        #--query 'Reservations[*].Instances[*].[PrivateIpAddress, PublicIpAddress]' \ 
       # --output text)
    else 
        echo "$i"
    fi
    echo "$i:$IP"
done 