#!/bin/bash -x
#Problem Statement : Tic Tac Toe Game.
#Discription : This problem simulates as a Tic Tac Toe Player would like to challenge computer.
#Author : Kunal Jadhav
#Date : 9 March 2020

row=3
column=3
function displayBoard() {
	for (( i=0; i<$row; i++ ))
	 do
		echo "---------------"
		for (( j=0; j<$column; j++))
		 do
			printf "| ${Board[$i,$j]} |"
		 done
		printf "\n"
	 done
		echo "---------------"
}

declare -A Board
function  boardMaking() {
	local nums=0
	for (( i=0; i<$row; i++ ))
	 do
		for (( j=0; j<$column; j++ ))
		 do
			Board[$i,$j]=$nums
			((nums++))
		 done
	 done
}

n=0
function assignLetter() {
	if [[ $(($n%2)) -eq 0 ]]
	 then
		echo "X"
	 else
		echo "O"
	fi
}

function whoPlays() {
state=$((RANDOM%2))
   if [[ $state -eq 1 ]]
    then
      echo "PlayerFirst"
    else
      echo "ComputerFirst"
   fi
}

function TicTacToeApp() {
	local win=0
	if [[ ${Board[0,0]} == "X" && ${Board[0,1]} == "X" && ${Board[0,2]} == "X" ]]
	 then
		win=1
	 elif [[ ${Board[1,0]} == "X" && ${Board[1,1]} == "X" && ${Board[1,2]} == "X" ]]
	 then
	 	win=1
	 elif [[ ${Board[2,0]} == "X" && ${Board[2,1]} == "X" && ${Board[2,2]} == "X" ]]
	 then
		win=1
	 elif [[ ${Board[0,0]} == "X" && ${Board[1,0]} == "X" && ${Board[2,0]} == "X" ]]
	 then
		win=1
	 elif [[ ${Board[0,1]} == "X" && ${Board[1,1]} == "X" && ${Board[2,1]} == "X" ]]
    then
		win=1
	 elif [[ ${Board[0,2]} == "X" && ${Board[1,2]} == "X" && ${Board[2,2]} == "X" ]]
	 then
		win=1
	 elif [[ ${Board[0,0]} == "X" && ${Board[1,1]} == "X" && ${Board[2,2]} == "X" ]]
    then
		win=1
	 elif [[ ${Board[0,2]} == "X" && ${Board[1,1]} == "X" && ${Board[2,0]} == "X" ]]
    then
		win=1
	fi

	if [[ ${Board[0,0]} == "O" && ${Board[0,1]} == "O" && ${Board[0,2]} == "O" ]]
    then
      win=1
    elif [[ ${Board[1,0]} == "O" && ${Board[1,1]} == "O" && ${Board[1,2]} == "O" ]]
    then
      win=1
    elif [[ ${Board[2,0]} == "O" && ${Board[2,1]} == "O" && ${Board[2,2]} == "O" ]]
    then
      win=1
    elif [[ ${Board[0,0]} == "O" && ${Board[1,0]} == "O" && ${Board[2,0]} == "O" ]]
    then
      win=1
    elif [[ ${Board[0,1]} == "O" && ${Board[1,1]} == "O" && ${Board[2,1]} == "O" ]]
    then
      win=1
    elif [[ ${Board[0,2]} == "O" && ${Board[1,2]} == "O" && ${Board[2,2]} == "O" ]]
    then
      win=1
    elif [[ ${Board[0,0]} == "O" && ${Board[1,1]} == "O" && ${Board[2,2]} == "O" ]]
    then
      win=1
    elif [[ ${Board[0,2]} == "O" && ${Board[1,1]} == "O" && ${Board[2,0]} == "O" ]]
    then
      win=1
   fi
	if [[ $win == 1 ]]
	 then
		printf "$player has won"
		displayBoard
	   exit
	fi
	if [[ $n == 8 ]]
	 then
		displayBoard
		printf "This match is a Tie"
		exit
	fi
}

Turn=$( whoPlays )
echo $Turn
boardMaking

function startGame() {
	while [[ $n -lt 9 ]]
	 do
		player=$( assignLetter )
		displayBoard
		read -p "Enter your position: " position
		newRI=$(($position / 3))
		newCI=$(($position % 3))
		Board[$newRI,$newCI]=$player
		TicTacToeApp
		((n++))
	 done
}
startGame
