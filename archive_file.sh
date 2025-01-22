#!/bin/bash

for file in /logfiles/*log
do
	if [ -f $file.tar.gz ]
	then
		#skips file already exists
		read -p "This archived file already exists would you like to overite the file?(y/n) " answer
		if $answer == y
		then
			tar -czvf /logfiles/$file.tar.gz $file
		else
			echo "We are skipping this file: $(file)"
			exit
		fi
	else
		tar -czvf /logfiles/$file.tar.gz $file
		
	fi
done
