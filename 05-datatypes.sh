#!/bin/bash
#echo "Type first value to be added:"
#read FIRSTVALUE
#echo "Enter second value to be added:"
#read SECONDVALUE
FIRSTVALUE=$1
SECONDVALUE=$2
echo "Total is $(($FIRSTVALUE+$SECONDVALUE))"

echo "Total arguments passed: $@"
echo "How many arguments passed: $#"
echo "Script name: $0"