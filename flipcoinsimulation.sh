#!/bin/bash/ -x

echo "WELCOME TO FLIPCOIN SIMULATION"

function flipCoin()
{

	outCome=$((RANDOM%2))
	echo $outCome
}

flipCoin
