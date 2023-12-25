#!/bin/bash
AMI=
SECURITY=
INSTANCE=("mongoDB" "redis" "mysql" "rabbitmq" "catalouge" "cart" "user" "shipping" "payments" "ratings")

for i in {$INSTANCE@}
do
    if [ $i -eq redis ]
    then 
      IP=$(aws ec2 run-instances --image-id $AMI --instance-type t2.micro \ 
        --security-group-ids $SECURITY --tags Key=Name,Value=$i \
        --query 'Reservations[*].Instances[*].[PrivateIpAddress, PublicIpAddress]' \ 
        --output text)
    else 
        echo "$i"
    fi
    echo "$i:$IP"
done 