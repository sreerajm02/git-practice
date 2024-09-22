#!/bin/bash


USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "please run this script with previlage accesss"
   exit 1
fi

VALIDATE(){
if [ $? -ne 0 ]
then
 echo "Function is failed"
 exit 1
 else
 echo "Funciton is Success"
 fi
}

dnf list installed git

VALIDATE $?

# if [ $? -ne 0 ]
# then 
#  echo "Git is not installed,going to installl ...."
#  dnf install git -y
#  else
#   echo "Git is already installed"
# fi

# dnf list installed mysql

# if [ $? -ne 0 ]
# then 
#  echo "mysql is not installed,going to installl ...."
#  dnf install mysql -y
#   if [ $? -ne 0 ]
#  then
#  echo "mysql is istallatin unsuccesfulll" 
#  exit 1
#  else 
#  echo "Mysql is installation success"
#  fi
#  else
#   echo "mysql is already installed"
# fi