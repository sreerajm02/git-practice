#!/bin/bash


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
   echo "please run this script with previlage accesss"
   exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]
then
 echo -e "$2 Function is $R failed $N"
 exit 1
 else
 echo -e "$2 Funciton is $G Success $N"
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