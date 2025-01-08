#!/bin/bash

#set age
age=21

#check if age is greater than 20
if [ $age -gt 20 ]
then
	echo "You are $age years old, so you are old enough to drink."
else
	echo "You are $age years old, so you are not old enough to drink"
fi

#check if file exists
if [ -f /myfile ]
then
	echo "this file exists."
else
	echo "this file does not exist."
fi
