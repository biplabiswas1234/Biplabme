#!/bin/bash 

echo -n  "[?] What would you like to do : "

echo "1) fahrenheit to Celcious"
echo "2) Celcious to fahrenheit"

echo
read select
echo
case $select in
    1)
        read -p"Enter fahrenheit value: " x
        if [ $x -lt 31 ] | [ $x -gt 212 ]
        then 
        echo Please enter correct range
        else
        echo $x fahrenheit is equal to 
        echo $x 32 5 9| awk '{print ($1-$2)*$3/$4}'
     	fi;;
    2)  
	read -p"Enter celcious value: " x
	if [ $x -lt 0 ] | [ $x -gt 100 ]
        then echo Please enter correct range
        else
        echo $x celcious is equal to 
        echo $x 9 5 32 | awk '{print $1*$2/$3+$4}'
    	fi;;
esac