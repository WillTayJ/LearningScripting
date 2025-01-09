#!/bin/bash

num=10

while [ $num -gt 0 ]
do
	echo $num
	num=$(( $num - 1 ))
	sleep 1
done

echo "Congratgulations! The countdown is done!"
