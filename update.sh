#!/bin/bash

release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

#if there is an error in the update this function will run to check the exit code
check_exit_code(){
	if [ $? -ne 0 ]
	then
		echo "An error occured, Please check the $errorlog file. Current Time: $(date)"
	fi
}

#confirming update is starting
update_start(){
	echo "update is starting... Current Time: $(date)"
}

#confirming update is finished
update_finish(){
	echo "update is complete! Current Time: $(date)"
}

#checks if redhat system
if grep -q "REDHAT" $release_file
then
	update_start
	#update for redhat systems
	sudo dnf update -y >>$logfile 2>>$errorlog
	update_finish
	check_exit_code

#check if ubuntu or debian system
elif grep -q "ubuntu" $release_file || grep -q "debian" $release_file
then
	update_start
	#update for ubuntu or debian systems
	sudo apt update -y >>$logfile 2>>$errorlog
	check_exit_code
	sudo apt dist-upgrade -y >>$logfile 2>>$errorlog
	update_finish
	check_exit_code

else
	#if script is not compatible for redhat, debian, or ubuntu systems the comment will show
	echo "Your system is not able to be updated at this time."
fi
