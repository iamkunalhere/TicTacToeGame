#!/bin/bash -x
#Problem Statement : Tic Tac Toe Game.
#Discription : This problem simulates as a Tic Tac Toe Player would like to challenge computer.
#Author : Kunal Jadhav
#Date : 9 March 2020

function displayBoard() {
	for (( i=0; i<3; i++ ))
	 do
		echo "---------------"
		for (( j=0; j<3; j++))
		 do
			printf "|   |"
		 done
		printf "\n"
	 done
		echo "---------------"
}

function assignLetter() {
 state=$((RANDOM%2))
	if [[ $state -eq 1 ]]
	 then
		echo "X"
	 else
		echo "O"
	fi
}

playerSign=$( assignLetter )

function whoPlays() {
state=$((RANDOM%2))
   if [[ $state -eq 1 ]]
    then
      echo "PlayerFirst"
    else
      echo "ComputerFirst"
   fi
}

Turn=$( whoPlays )
echo $Turn
displayBoard
