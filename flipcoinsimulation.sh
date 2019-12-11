#!/bin/bash/ -x

headCount=0
tailCount=0

declare -A resultDictionary
declare -A percentageDictionary

echo "WELCOME TO FLIPCOIN SIMULATION"
read -p "how much time you flip coin " trials
read -p "how many coins " numberOfCoin

function flipcoin() 
{
	for (( i=1; i<=$trials; i++ ))
	do
		string=""
		for(( j=0; j<$numberOfCoin; j++ ))
		do
   			outCome=$(( RANDOM % 2 ))
     			if [ $outCome == 1 ]
				then
  						string=$string"H"
          			headCount=$(( $headCount + 1 ))
				else
           			string=$string"T"
          			tailCount=$(( $tailCount + 1))
				fi
		done
		echo key : $string
		resultDictionary["$string"]=$(( ${resultDictionary["$string"]} + 1 ))  
		done
}
flipcoin

echo ${!resultDictionary[@]}
echo ${resultDictionary[@]}


for i in "${!resultDictionary[@]}"
do

		 percentageDictionary[$i]=$(( (100*${resultDictionary[$i]})/ $trials ))
done

