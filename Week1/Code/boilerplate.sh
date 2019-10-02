#!/bin/bash
# Author: Your Name your.login@imperial.ac.uk
# Script: boilerplate.sh
# Desc: simple boilerplate for shell scripts
# Arguments: none
# Date: Oct 2018

echo -e "\nThis is a shell script! \n" #what does -e do?
echo "Remove    excess      spaces." | tr -s "\b" " "
echo "remove all the as" | tr -d "a"
echo "set to uppercase" | tr [:lower:] [:upper:]
echo "10.00 only numbers 1.33" | tr -d [:alpha:] | tr -s " " ","
#exit
