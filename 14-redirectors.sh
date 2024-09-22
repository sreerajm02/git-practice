#!/bin/bash


LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
DATE=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$DATE.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
   echo -e "$R please run this script with previlage accesss $N" &>>$LOG_FILE
   exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]
then
 echo -e "$2 Function is $R failed $N" &>>$LOG_FILE
 exit 1
 else
 echo -e "$2 Funciton is $G Success $N" &>>$LOG_FILE
 fi
}

for package in $@
do 
  dnf list installed $package &>>$LOG_FILE
  if [ $? -ne 0 ]
  then 
    echo "$package is not installed..going to install" &>>$LOG_FILE
    dnf install $package -y &>>$LOG_FILE
    VALIDATE $? "Installing $package"
else
   echo "$package already installed" &>>$LOG_FILE
   fi
done

