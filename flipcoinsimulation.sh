#!/bin/bash/ -x

#LOCAL VARIABLES
isHead=1
isTail=0
HCount=0
TCount=0

declare -A dicResult

echo "WELCOME TO FLIPCOIN SIMULATOR"
read -p "how many times you want to Flip a coin?" trials

for((i=0;i<trials;i++))
do

	result=$((RANDOM%2))
	if [ $result -eq $isHead ]
	then
		HCount=$((Hcount+1))
		dicResult[heads]=$HCount
	else
		TCount=$((TCount+1))
		dicResult[tail]=$TCount
	fi
	echo $result
done

total=$(( $HCount+$TCount ))
head=$(( $HCount*100 ))
headPercent=$(( $head/$total ))
tail=$(( $TCount*100 ))
tailPercent=$(( $tail/$total ))
echo $headPercent
echo $tailPercent
