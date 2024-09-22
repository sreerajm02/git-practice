#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "please run this script with previlage accesss"
   exit 1
fi   
