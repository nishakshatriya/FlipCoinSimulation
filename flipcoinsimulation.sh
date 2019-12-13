#!/bin/bash/ -x

echo "WELCOME TO FLIPCOIN SIMULATION"

headCount=0
tailCount=0

declare -A resultDictionary
declare -A headTailCombinations

read -p "how much time you flip coin " trials
read -p "how many coins " coins

function flipcoin() 
{
	for (( i=1; i<=$trials; i++ ))
	do
		string=""
		for(( j=0; j<$coins; j++ ))
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
		resultDictionary["$string"]=$(( ${resultDictionary["$string"]} + 1 ))  
	done
}

function getPercent()
{
	for i in "${!resultDictionary[@]}"
	do
		 headTailCombinations[$i]=$(( (100*${resultDictionary[$i]})/ $trials ))
	done
}

function sorting()
{
	for i in ${!headTailCombinations[@]}
	do
		echo $i ${headTailCombinations[$i]}

	done | sort -k2 -nr | awk 'NR==1{print $1" "$2}'
}

function main()
{
	flipcoin
	getPercent
	sorting
}
main
