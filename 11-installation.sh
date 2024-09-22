#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "please run this script with previlage accesss"
   exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then 
 echo "Git is not installed,going to installl ...."
 dnf install git -y
 else
  echo "Git is already installed"
fi