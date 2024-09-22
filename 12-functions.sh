#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "please run this script with previlage accesss"
   exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]
then
 echo "$2 Function is failed"
 exit 1
 else
 echo "$2 Funciton is Success"
 fi
}

dnf list installed git

VALIDATE $? "Listing Git"


dnf list installed mysql

if [ $? -ne 0 ]
then 
 echo "mysql is not installed,going to installl ...."
 dnf install mysql -y
VALIDATE $? "Install MYSQL"  
 else
  echo "mysql is already installed"
fi