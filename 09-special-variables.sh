#!/bin/bash

echo "I want all the variable pssed to the script : $@"
echo "I want how many variable pssed to the script : $#"
echo "I want know current script name : $0"
echo "current Direcotry : $PWD"
echo "current Home Direcotry : $HOME"
echo "current process ID : $$"

sleep 100 &
echo "process ID of last background command: $!"


