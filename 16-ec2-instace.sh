#!/bin/bash
AMI="ami-03265a0778a880afb"
SECURITY="sg-0773d1c611d536265"
INSTANCE=("mongodb" "catalogue" "web")
#INSTANCE=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "cart" "user" "shipping" "payment" "dispatch" "web")
DOMAIN_NAME="aws2day.online"
ZONE_ID=Z07707692IZAFTSKYYTLY

for i in ${INSTANCE[@]}
do

    if [ $i == "mysql" ] || [ $i == "mongodb" ] || [ $i == "shipping" ]
    then 
       INSTANCE_TYPE="t3.small"
    else 
        INSTANCE_TYPE="t2.micro"
    fi
   IP=$(aws ec2 run-instances --image-id $AMI --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" --query 'Instances[0].[PrivateIpAddress]' --output text)
        echo "ServerName: $i  Private_IP_Address: $IP"
 
# create R53 record, make sure you delete existing record
aws route53 change-resource-record-sets \
--hosted-zone-id $ZONE_ID \
--change-batch '
{
    "Comment": "Creating a record set for cognito endpoint",
    "Changes": [{
    "Action" : "UPSERT", 
    "ResourceRecordSet" : {
        "Name" : "'$i'.'$DOMAIN_NAME'",
        "Type" : "A",
        "TTL" : 1,
        "ResourceRecords" : [{
            "Value" : "'$IP'"
        }]
    }    
    }]
}
    '
done 
