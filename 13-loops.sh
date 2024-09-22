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

for package in $@
do 
  dnf list installed $package
  if [ $? -ne 0 ]
  then 
    echo "$package is not installed..going to install"
    dnf install $package -y
    VALIDATE $? "Installing $package"
else
   echo "$package already installed"
done