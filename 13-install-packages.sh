#!/bin/bash
ID=(id -u)
if ( $ID -ne 0 )
then
echo "retry script with sudo"
fi
