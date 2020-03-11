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
      echo "Player"
    else
      echo "Computer"
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
		printf "$playerSign has won"
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

function computerPlay() {


if [[ ${Board[0,0]} == "$prevSign" && ${Board[0,1]} == "$prevSign" && ${Board[0,2]} == "2" ]]
    then
      Board[0,2]=$playerSign
    elif [[ ${Board[0,1]} == "$prevSign" && ${Board[0,2]} == "$prevSign" && ${Board[0,0]} == "0" ]]
    then
      Board[0,0]=$playerSign
    elif [[ ${Board[0,0]} == "$prevSign" && ${Board[0,2]} == "$prevSign" && ${Board[0,1]} == "1" ]]
    then
      Board[0,1]=$playerSign
#----------------------------------------------------------------------------------------------------------
    elif [[ ${Board[1,0]} == "$prevSign" && ${Board[1,1]} == "$prevSign" && ${Board[1,2]} == "5" ]]
    then
      Board[1,2]=$playerSign
    elif [[ ${Board[1,1]} == "$prevSign" && ${Board[1,2]} == "$prevSign" && ${Board[1,0]} == "3" ]]
    then
      Board[1,0]=$playerSign
    elif [[ ${Board[1,0]} == "$prevSign" && ${Board[1,2]} == "$prevSign" && ${Board[1,1]} == "4" ]]
    then
      Board[1,1]=$playerSign
#--------------------------------------------------------------------------------------------------------
    elif [[ ${Board[2,0]} == "$prevSign" && ${Board[2,1]} == "$prevSign" && ${Board[2,2]} == "8" ]]
    then
      Board[2,2]=$playerSign
    elif [[ ${Board[2,1]} == "$prevSign" && ${Board[2,2]} == "$prevSign" && ${Board[2,0]} == "6" ]]
    then
      Board[2,0]=$playerSign
    elif [[ ${Board[2,0]} == "$prevSign" && ${Board[2,2]} == "$prevSign" && ${Board[2,1]} == "7" ]]
    then
      Board[2,1]=$playerSign
#--------------------------------------------------------------------------------------------------------
    elif [[ ${Board[0,0]} == "$prevSign" && ${Board[1,0]} == "$prevSign" && ${Board[2,0]} == "6" ]]
    then
      Board[2,0]=$playerSign
    elif [[ ${Board[1,0]} == "$prevSign" && ${Board[2,0]} == "$prevSign" && ${Board[0,0]} == "0" ]]
    then
      Board[0,0]=$playerSign
    elif [[ ${Board[0,0]} == "$prevSign" && ${Board[2,0]} == "$prevSign" && ${Board[1,0]} == "3" ]]
    then
      Board[1,0]=$playerSign
#------------------------------------------------------------------------------------------------------- 
    elif [[ ${Board[0,1]} == "$prevSign" && ${Board[1,1]} == "$prevSign" && ${Board[2,1]} == "7" ]]
    then
      Board[2,1]=$playerSign
    elif [[ ${Board[1,1]} == "$prevSign" && ${Board[2,1]} == "$prevSign" && ${Board[0,1]} == "1" ]]
    then
      Board[0,1]=$playerSign
    elif [[ ${Board[0,1]} == "$prevSign" && ${Board[2,1]} == "$prevSign" && ${Board[1,1]} == "4" ]]
    then
      Board[1,1]=$playerSign
#------------------------------------------------------------------------------------------------------- 
    elif [[ ${Board[0,2]} == "$prevSign" && ${Board[1,2]} == "$prevSign" && ${Board[2,2]} == "8" ]]
    then
      Board[2,2]=$playerSign
    elif [[ ${Board[1,2]} == "$prevSign" && ${Board[2,2]} == "$prevSign" && ${Board[0,2]} == "2" ]]
    then
      Board[0,2]=$playerSign
    elif [[ ${Board[0,2]} == "$prevSign" && ${Board[2,2]} == "$prevSign" && ${Board[1,2]} == "5" ]]
    then
      Board[1,2]=$playerSign
#------------------------------------------------------------------------------------------------------  
    elif [[ ${Board[0,0]} == "$prevSign" && ${Board[2,2]} == "$prevSign" && ${Board[1,1]} == "4" ]]
    then
      Board[1,1]=$playerSign
    elif [[ ${Board[0,0]} == "$prevSign" && ${Board[1,1]} == "$prevSign" && ${Board[2,2]} == "8" ]]
    then
      Board[2,2]=$playerSign
    elif [[ ${Board[1,1]} == "$prevSign" && ${Board[2,2]} == "$prevSign" && ${Board[0,0]} == "0" ]]
    then
      Board[0,0]=$playerSign
#------------------------------------------------------------------------------------------------------  
    elif [[ ${Board[2,0]} == "$prevSign" && ${Board[0,2]} == "$prevSign" && ${Board[1,1]} == "4" ]]
    then
      Board[1,1]=$playerSign
	 elif [[ ${Board[2,0]} == "$prevSign" && ${Board[1,1]} == "$prevSign" && ${Board[0,2]} == "2" ]]
    then
      Board[0,2]=$playerSign
    elif [[ ${Board[1,1]} == "$prevSign" && ${Board[0,2]} == "$prevSign" && ${Board[2,0]} == "6" ]]
    then
      Board[2,0]=$playerSign

	 elif [[ ${Board[0,0]} == "$playerSign" && ${Board[0,1]} == "$playerSign" && ${Board[0,2]} == "2" ]]
    then
      Board[0,2]=$playerSign
    elif [[ ${Board[0,1]} == "$playerSign" && ${Board[0,2]} == "$playerSign" && ${Board[0,0]} == "0" ]]
    then
      Board[0,0]=$playerSign
    elif [[ ${Board[0,0]} == "$playerSign" && ${Board[0,2]} == "$playerSign" && ${Board[0,1]} == "1" ]]
    then
      Board[0,1]=$playerSign
#----------------------------------------------------------------------------------------------------------
    elif [[ ${Board[1,0]} == "$playerSign" && ${Board[1,1]} == "$playerSign" && ${Board[1,2]} == "5" ]]
    then
      Board[1,2]=$playerSign
    elif [[ ${Board[1,1]} == "$playerSign" && ${Board[1,2]} == "playerSign" && ${Board[1,0]} == "3" ]]
    then
      Board[1,0]=$playerSign
    elif [[ ${Board[1,0]} == "$playerSign" && ${Board[1,2]} == "$playerSign" && ${Board[1,1]} == "4" ]]
    then
      Board[1,1]=$playerSign
#--------------------------------------------------------------------------------------------------------
    elif [[ ${Board[2,0]} == "$playerSign" && ${Board[2,1]} == "$playerSign" && ${Board[2,2]} == "8" ]]
    then
      Board[2,2]=$playerSign
    elif [[ ${Board[2,1]} == "$playerSign" && ${Board[2,2]} == "$playerSign" && ${Board[2,0]} == "6" ]]
    then
     	Board[2,0]=$playerSign
    elif [[ ${Board[2,0]} == "$playerSign" && ${Board[2,2]} == "$playerSign" && ${Board[2,1]} == "7" ]]
    then
      Board[2,1]=$playerSign
#--------------------------------------------------------------------------------------------------------
	 elif [[ ${Board[0,0]} == "$playerSign" && ${Board[1,0]} == "$playerSign" && ${Board[2,0]} == "6" ]]
    then
      Board[2,0]=$playerSign
	 elif [[ ${Board[1,0]} == "$playerSign" && ${Board[2,0]} == "$playerSign" && ${Board[0,0]} == "0" ]]
    then
      Board[0,0]=$playerSign
	 elif [[ ${Board[0,0]} == "$playerSign" && ${Board[2,0]} == "$playerSign" && ${Board[1,0]} == "3" ]]
    then
      Board[1,0]=$playerSign
#-------------------------------------------------------------------------------------------------------
	 elif [[ ${Board[0,1]} == "$playerSign" && ${Board[1,1]} == "$playerSign" && ${Board[2,1]} == "7" ]]
    then
      Board[2,1]=$playerSign
	 elif [[ ${Board[1,1]} == "$playerSign" && ${Board[2,1]} == "$playerSign" && ${Board[0,1]} == "1" ]]
    then
      Board[0,1]=$playerSign
	 elif [[ ${Board[0,1]} == "$playerSign" && ${Board[2,1]} == "$playerSign" && ${Board[1,1]} == "4" ]]
    then
      Board[1,1]=$playerSign
#-------------------------------------------------------------------------------------------------------
	 elif [[ ${Board[0,2]} == "$playerSign" && ${Board[1,2]} == "$playerSign" && ${Board[2,2]} == "8" ]]
    then
      Board[2,2]=$playerSign
	 elif [[ ${Board[1,2]} == "$playerSign" && ${Board[2,2]} == "$playerSign" && ${Board[0,2]} == "2" ]]
	 then
      Board[0,2]=$playerSign
	 elif [[ ${Board[0,2]} == "$playerSign" && ${Board[2,2]} == "$playerSign" && ${Board[1,2]} == "5" ]]
    then
      Board[1,2]=$playerSign
#------------------------------------------------------------------------------------------------------
	 elif [[ ${Board[0,0]} == "$playerSign" && ${Board[2,2]} == "$playerSign" && ${Board[1,1]} == "4" ]]
    then
      Board[1,1]=$playerSign
	 elif [[ ${Board[0,0]} == "$playerSign" && ${Board[1,1]} == "$playerSign" && ${Board[2,2]} == "8" ]]
    then
      Board[2,2]=$playerSign
	 elif [[ ${Board[1,1]} == "$playerSign" && ${Board[2,2]} == "$playerSign" && ${Board[0,0]} == "0" ]]
    then
      Board[0,0]=$playerSign
#------------------------------------------------------------------------------------------------------
	 elif [[ ${Board[2,0]} == "$playerSign" && ${Board[0,2]} == "$playerSign" && ${Board[1,1]} == "4" ]]
    then
      Board[1,1]=$playerSign
	 elif [[ ${Board[2,0]} == "$playerSign" && ${Board[1,1]} == "$playerSign" && ${Board[0,2]} == "2" ]]
    then
      Board[0,2]=$playerSign
	 elif [[ ${Board[1,1]} == "$playerSign" && ${Board[0,2]} == "$playerSign" && ${Board[2,0]} == "6" ]]
    then
      Board[2,0]=$playerSign
	 else
	 	cPosition=$((RANDOM%9))
   	newRI=$(($cPosition / 3))
   	newCI=$(($cPosition % 3))
   	if [[ ${Board[$newRI,$newCI]} == "X" || ${Board[$newRI,$newCI]} == "O" ]]
    	 then
      	computerPlay
    	 else
      	Board[$newRI,$newCI]=$playerSign
   	fi
fi
}

function playerPlay() {
	read -p "Enter your position: " uPosition
	newRI=$(($uPosition / 3))
	newCI=$(($uPosition % 3))
	Board[$newRI,$newCI]=$playerSign
}

Turn=$( whoPlays )
boardMaking
prevSign=X
function startGame() {
if [[ $Turn -eq "Player" ]]
 then
	p=0
	printf "Player will play first"
 else
	p=1
	printf "Computer will play first"
fi
	displayBoard
	while [[ $n -lt 9 ]]
	 do
		if [[ $(($p % 2)) -eq 0 ]]
		 then
			playerSign=$( assignLetter )
			playerPlay
		 else
			playerSign=$( assignLetter )
			computerPlay
		fi
		displayBoard
		TicTacToeApp
		((n++))
      ((p++))
	 done
}
startGame
