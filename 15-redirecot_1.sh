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
   echo -e "$R please run this script with previlage accesss $N" | tee -a $LOG_FILE
   exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]
then
 echo -e "$2 Function is $R failed $N" | tee -a $LOG_FILE
 exit 1
 else
 echo -e "$2 Funciton is $G Success $N" | tee -a $LOG_FILE
 fi
}

USAGE(){
  echo "Usge :: sudo sh filename pakg1 pckg2 etc..."    
  exit 1
}

echo "Script excuation staeted at : $(date)"

if [ $# -eq 0 ]
then 
  USAGE
fi

for package in $@
do 
  dnf list installed $package &>>$LOG_FILE
  if [ $? -ne 0 ]
  then 
    echo "$package is not installed..going to install" | tee -a $LOG_FILE
    dnf install $package -y &>>$LOG_FILE
    VALIDATE $? "Installing $package"
else
   echo "$package already installed" | tee -a $LOG_FILE
   fi
done

