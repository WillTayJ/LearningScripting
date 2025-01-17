#!/bin/bash

#Accept user input for countdown starting point
read -p "Where would you like the countdown to start from?" num

#countdown loop will print number as counting down
while [ $num -gt 0 ]
do
	echo $num
	num=$(( $num - 1 ))
	sleep 1
done

#When countdown is at the end prints message
echo "Congratgulations! The countdown is done!"
