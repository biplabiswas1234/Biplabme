
#!/bin/bash

declare -A dailyWage;

function calculateWorkingHour() {
	case $1 in
		0)	#echo "Employee is absent";
			workingHour=0;
			;;

		1)	#echo "Employee is present";
			workingHour=8;
			;;
		2)	#echo "Employee is working as part time";
			workingHour=8;
			;;
	esac;
	echo $workingHour;
}

perHourSalary=20;
totalSalary=0;
totalWorkingHour=0;
day=1;

while [[ $day -le 20 && $totalWorkingHour -lt 100 ]]
do
	wHour=$(calculateWorkingHour $((RANDOM%3)));
	totalWorkingHour=$(($totalWorkingHour + $wHour));
	if [ $totalWorkingHour -gt 100 ]
	then
		totalWorkingHour=$(($totalWorkingHour - $wHour));
		break;
	fi
	salary=$(($perHourSalary * $wHour));
	dailyWage["Day"$day]=$salary;
	totalSalary=$(($totalSalary + $salary));
	((day++));
done

echo "Employee has earned $totalSalary $ in a month (Total working Hour : $totalWorkingHour)";

echo ${dailyWage[@]};
echo ${!dailyWage[@]};

for ((i=1;i<=${#dailyWage[@]};i++))
do
	echo "Day$i : $"${dailyWage["Day$i"]} "USD";
done