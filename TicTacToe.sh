#!/bin/bash -x
#Problem Statement : Tic Tac Toe Game.
#Discription : This problem simulates as a Tic Tac Toe Player would like to challenge computer.
#Author : Kunal Jadhav
#Date : 9 March 2020

declare -A Board
#CONSTANTS
ROW=$1
COLUMN=$1
NUMBEROFTURNS=$((ROW*COLUMN))
TWODIGITS=10
#VARIABLES
changeTurn=0
playerSign=0
prevSign=0
checkSign=0
flagForSwitchFunctions=0
function displayBoard() {
	for (( rowIndex=0; rowIndex<ROW; rowIndex++ ))
	 do
		echo
		for (( columnIndex=0; columnIndex<COLUMN; columnIndex++))
		 do
			if [[ ${Board[$rowIndex,$columnIndex]} -ge $TWODIGITS ]]; then
				printf "| ${Board[$rowIndex,$columnIndex]}  |"
			 else
			printf "|  ${Board[$rowIndex,$columnIndex]}  |"
			fi
		 done
		printf "\n"
	 done
	echo
}
function  buildTheBoard() {
	local numbers=0
	for (( rowIndex=0; rowIndex<ROW; rowIndex++ ))
	 do
		for (( columnIndex=0; columnIndex<COLUMN; columnIndex++ ))
		 do
			Board[$rowIndex,$columnIndex]=$numbers
			((numbers++))
		 done
	 done
}
function assignLetter() {
	if [[ $(($changeTurn%2)) -eq 0 ]]; then
		echo "X"
	 else
		echo "O"
	fi
}
function whoPlays() {
	state=$((RANDOM%2))
   if [[ $state -eq 1 ]]; then
      echo "Player"
    else
      echo "Computer"
   fi
}
function TicTacToeApp() {
	local rowCounter=0
	local	columnCounter=0
	local leftDiCounter=0
	local rightDiCounter=0
	for (( rowIndex=0; rowIndex<ROW; rowIndex++))
	 do
		for (( columnIndex=0; columnIndex<COLUMN; columnIndex++))
		 do
			if [[ ${Board[$rowIndex,$columnIndex]} == "$playerSign" ]]; then
				((rowCounter++))
			fi
			if [[ ${Board[$columnIndex,$rowIndex]} == "$playerSign" ]]; then
				((columnCounter++))
			fi
			if [[ $rowIndex == $columnIndex && ${Board[$rowIndex,$columnIndex]} == "$playerSign" ]]; then
				((leftDiCounter++))
			fi
			if [[ $columnIndex == $((ROW-rowIndex-1)) && ${Board[$rowIndex,$columnIndex]} == "$playerSign" ]]; then
				((rightDiCounter++))
			fi
			if [[ $rowCounter == $COLUMN || $columnCounter == $COLUMN || $leftDiCounter == $COLUMN || $rightDiCounter == $COLUMN ]]; then
					echo "$playerSign is Winner"
					displayBoard
					exit
			fi
	      if [[ $columnIndex == $((ROW-1)) ]]; then
	         rowCounter=0
   	      columnCounter=0
      	fi
		 done
	 done
	if [[ $changeTurn == $((NUMBEROFTURNS-1)) ]]; then
		displayBoard
		printf "Game Over"
		exit
	fi
}
function rowChecker() {
	local rowCounter=0
	local putInRow=0
	local putInColumn=0
	for (( rowIndex=0; rowIndex<ROW; rowIndex++))
	 do
		for (( columnIndex=0; columnIndex<COLUMN; columnIndex++))
		 do
			if [[ ${Board[$rowIndex,$columnIndex]} == "$checkSign" ]]; then
				((rowCounter++))
			fi
			if [[ ${Board[$rowIndex,$columnIndex]} != "$checkSign" ]]; then
				putInRow=$rowIndex
				putInColumn=$columnIndex
			fi
		 done
if [[ $rowCounter == $((ROW-1)) && ${Board[$putInRow,$putInColumn]} != "$prevSign" && ${Board[$putInRow,$putInColumn]} != "$playerSign" ]]
 then
	Board[$putInRow,$putInColumn]=$playerSign
	flagForSwitchFunctions=1
	return
fi
	rowCounter=0
	 done
}
function columnChecker() {
	local columnCounter=0
	local putInRow=0
	local putInColumn=0
	for (( rowIndex=0; rowIndex<ROW; rowIndex++))
    do
      for (( columnIndex=0; columnIndex<COLUMN; columnIndex++))
       do
         if [[ ${Board[$columnIndex,$rowIndex]} == "$checkSign" ]]; then
            ((columnCounter++))
         fi
         if [[ ${Board[$columnIndex,$rowIndex]} != "$checkSign" ]]; then
            putInRow=$columnIndex
            putInColumn=$rowIndex
         fi
       done
if [[ $columnCounter == $((ROW-1)) && ${Board[$putInRow,$putInColumn]} != "$prevSign" && ${Board[$putInRow,$putInColumn]} != "$playerSign" ]]
 then
	Board[$putInRow,$putInColumn]=$playerSign
	flagForSwitchFunctions=1
	return
fi
	columnCounter=0
    done
}
function leftDiagonalChecker() {
	local leftDiCounter=0
	local leftDiRow=0
	local leftDiCol=0
	for (( rowIndex=0; rowIndex<ROW; rowIndex++ ))
	 do
		for (( columnIndex=0; columnIndex<COLUMN; columnIndex++ ))
		 do
			if [[ $rowIndex == $columnIndex && ${Board[$rowIndex,$columnIndex]} == "$checkSign" ]]; then
            ((leftDiCounter++))
			fi
			if [[ $rowIndex == $columnIndex && ${Board[$rowIndex,$columnIndex]} != "$checkSign" ]]; then
				leftDiRow=$rowIndex
				leftDiCol=$columnIndex
			fi
		 done
	 done
if [[ $leftDiCounter == $((ROW-1)) && ${Board[$leftDiRow,$leftDiCol]} != "$prevSign" && ${Board[$leftDiRow,$leftDiCol]} != "$playerSign" ]]
 then
	Board[$leftDiRow,$leftDiCol]=$playerSign
	flagForSwitchFunctions=1
	return
fi
}
function rightDiagonalChecker() {
	local rightDiCounter=0
	local rightDiRow=0
	local rightDiCol=0
   for (( rowIndex=0; rowIndex<ROW; rowIndex++ ))
    do
      for (( columnIndex=0; columnIndex<COLUMN; columnIndex++ ))
       do
			if [[ $columnIndex == $((ROW-rowIndex-1)) && ${Board[$rowIndex,$columnIndex]} == "$checkSign" ]]; then
				((rightDiCounter++))
			fi
			if [[ $columnIndex == $((ROW-rowIndex-1)) && ${Board[$rowIndex,$columnIndex]} != "$checkSign" ]]; then
				rightDiRow=$rowIndex
				rightDiCol=$columnIndex
			fi
		 done
	 done
if [[ $rightDiCounter == $((ROW-1)) && ${Board[$rightDiRow,$rightDiCol]} != "$prevSign" && ${Board[$rightDiRow,$rightDiCol]} != "$playerSign" ]]
 then
	Board[$rightDiRow,$rightDiCol]=$playerSign
	flagForSwitchFunctions=1
	return
fi
}
function cornerCheck() {
	for (( number=0; number<$((ROW*ROW)); number++ ))
	 do
		if [[ $number == $((ROW-ROW)) || $number == $((ROW-1)) || $number == $((ROW*ROW-ROW)) || $number == $((ROW*ROW-1)) ]];
		 then
			if [[ ${Board[$((number/ROW)),$((number%ROW))]} != "$prevSign" && ${Board[$((number/ROW)),$((number%ROW))]} != "$playerSign" ]]; then
				Board[$((number/ROW)),$((number%ROW))]=$playerSign
				flagForSwitchFunctions=1
				return
			fi
		fi
	 done
}
function centerCheck() {
	local center=$((ROW*ROW/2))
	if [[ ${Board[$((center/ROW)),$((center%ROW))]} != "$prevSign" && ${Board[$((center/ROW)),$((center%ROW))]} != "$playerSign" ]]; then
		Board[$((center/ROW)),$((center%ROW))]=$playerSign
		flagForSwitchFunctions=1
		return
	fi
}
function sidesCheck() {
	local counter=0
	for (( rowIndex=0; rowIndex<ROW; rowIndex++ ))
	 do
		for (( columnIndex=0; columnIndex<COLUMN; columnIndex++ ))
		 do
			if [[ $((counter%2)) != 0 && ${Board[$rowIndex,$columnIndex]} != "$prevSign" && ${Board[$rowIndex,$columnIndex]} != "$playerSign" ]]
			 then
				Board[$rowIndex,$columnIndex]=$playerSign
				flagForSwitchFunctions=1
				return
			fi
			((counter++))
		 done
	 done
}
function winOrBlockCheck() {
		rowChecker
   if [[ $flagForSwitchFunctions == 1 ]]; then
      return
   fi
      columnChecker
   if [[ $flagForSwitchFunctions == 1 ]]; then
      return
   fi
      leftDiagonalChecker
   if [[ $flagForSwitchFunctions == 1 ]]; then
      return
   fi
      rightDiagonalChecker
}
function computerPlay() {
	checkSign=$playerSign
		winOrBlockCheck
	if [[ $flagForSwitchFunctions == 1 ]]; then
		return
	fi
	checkSign=$prevSign
		winOrBlockCheck
	if [[ $flagForSwitchFunctions == 1 ]]; then
      return
	fi
		cornerCheck
	if [[ $flagForSwitchFunctions == 1 ]]; then
		return
	fi
		centerCheck
	if [[ $flagForSwitchFunctions == 1 ]]; then
		return
	fi
		sidesCheck
}
function playerPlay() {
	local userPosition=0
	local newRowIndex=0
	local newColumnIndex=0
	read -p "Enter your position: " userPosition
	newRowIndex=$(($userPosition / $ROW))
	newColumnIndex=$(($userPosition % $COLUMN))
	Board[$newRowIndex,$newColumnIndex]=$playerSign
}
function startGame() {
	local playTurn=0
	if [[ $Turn == "Player" ]]; then
		playTurn=0
		printf "$Turn will play first"
		printf "\n"
 	 elif [[ $Turn == "Computer" ]]; then
		playTurn=1
		printf "$Turn will play first"
		printf "\n"
	fi
	while [[ $changeTurn -lt $NUMBEROFTURNS ]]
	 do
		prevSign=$playerSign
		if [[ $(($playTurn % 2)) -eq 0 ]]; then
			playerSign=$( assignLetter )
			playerPlay
		 else
			flagForSwitchFunctions=0
			playerSign=$( assignLetter )
			computerPlay
		fi
		displayBoard
		TicTacToeApp
		((changeTurn++))
      ((playTurn++))
	 done
}
buildTheBoard
displayBoard
Turn=$( whoPlays )
startGame
