#!/bin/bash

release_file=/etc/os-release

#checks if redhat system
if grep -q "REDHAT" $release_file
then
	#update for redhat systems
	sudo dnf update -y

#check if ubuntu or debian system
elif grep -q "ubuntu" $release_file || grep -q "debian" $release_file
then
	#update for ubuntu or debian systems
	sudo apt update -y
	sudo apt update -y
	sudo apt dist-upgrade -y

else
	#if script is not compatible for redhat, debian, or ubuntu systems the comment will show
	echo "Your system is not able to be updated at this time."
fi
