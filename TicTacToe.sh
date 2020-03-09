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
displayBoard
