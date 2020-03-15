#!/bin/bash -x
#Problem Statement : Tic Tac Toe Game.
#Discription : This problem simulates as a Tic Tac Toe Player would like to challenge computer.
#Author : Kunal Jadhav
#Date : 9 March 2020
ROW=3
COLUMN=3
declare -A Board
n=0
prevSign=0
checkSign=0
flagForSwitchFunctions=0
function displayBoard() {
	for (( i=0; i<$ROW; i++ ))
	 do
		echo
#		echo "---------------"
		for (( j=0; j<$COLUMN; j++))
		 do
			if [[ ${Board[$i,$j]} -ge 10 ]]
			 then
				printf "| ${Board[$i,$j]}  |"
			 else
			printf "|  ${Board[$i,$j]}  |"
			fi
		 done
		printf "\n"
	 done
	echo
#	echo "---------------"
}
function  buildTheBoard() {
	local nums=0
	for (( i=0; i<$ROW; i++ ))
	 do
		for (( j=0; j<$COLUMN; j++ ))
		 do
			Board[$i,$j]=$nums
			((nums++))
		 done
	 done
}
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
	local rowCounter=0
	local	colCounter=0
	local leftDiCounter=0
	local rightDiCounter=0
	local currentRow=0
	local currentColumn=0
	for ((i=0; i<$ROW; i++))
	 do
		currentRow=i
		for ((j=0; j<$COLUMN; j++))
		 do
			if [[ ${Board[$i,$j]} == "$playerSign" ]]
			 then
				((rowCounter++))
			fi
			if [[ ${Board[$j,$i]} == "$playerSign" ]]
			 then
				((colCounter++))
			fi
			if [[ $i == $j && ${Board[$i,$j]} == "$playerSign" ]]
			 then
				((leftDiCounter++))
			fi
			if [[ $j == $(($ROW-$currentRow-1)) && ${Board[$i,$j]} == "$playerSign" ]]
			 then
				((rightDiCounter++))
			fi
			if [[ $rowCounter == $COLUMN || $colCounter == $COLUMN || $leftDiCounter == $COLUMN || $rightDiCounter == $COLUMN ]]
			 then
					echo "$playerSign is Winner"
					displayBoard
					exit
			fi
			if [[ $j == $(($ROW-1)) ]]
			 then
				rowCounter=0
				colCounter=0
			fi
		 done
	 done
	if [[ $n == 8 ]]; then
		displayBoard
		printf "Game Over"
		exit
	fi
}
function rowChecker() {
	local rowCounter=0
	local putInRow=0
	local putInColumn=0
	for ((i=0; i<$ROW; i++))
	 do
		for ((j=0; j<$COLUMN; j++))
		 do
			if [[ ${Board[$i,$j]} == "$checkSign" ]]
			 then
				((rowCounter++))
			fi
			if [[ ${Board[$i,$j]} != "$checkSign" ]]
			 then
				putInRow=$i
				putInColumn=$j
			fi
		 done
if [[ $rowCounter == $(($ROW-1)) && ${Board[$putInRow,$putInColumn]} != "$prevSign" && ${Board[$putInRow,$putInColumn]} != "$playerSign" ]]
          then
            Board[$putInRow,$putInColumn]=$playerSign
            flagForSwitchFunctions=1
            return
          else
				rowCounter=0
fi
	 done
}
function columnChecker() {
	local columnCounter=0
	local putInRow=0
	local putInColumn=0
	for ((i=0; i<$ROW; i++))
    do
      for ((j=0; j<$COLUMN; j++))
       do
         if [[ ${Board[$j,$i]} == "$checkSign" ]]
          then
            ((columnCounter++))
         fi
         if [[ ${Board[$j,$i]} != "$checkSign" ]]
          then
            putInRow=$j
            putInColumn=$i
         fi
       done
if [[ $columnCounter == $(($ROW-1)) && ${Board[$putInRow,$putInColumn]} != "$prevSign" && ${Board[$putInRow,$putInColumn]} != "$playerSign" ]]
          then
            Board[$putInRow,$putInColumn]=$playerSign
            flagForSwitchFunctions=1
            return
          else
      		columnCounter=0
fi
    done
}
function leftDiagonalChecker() {
	local leftDiCounter=0
	local leftDiRow=0
	local leftDiCol=0
	for (( i=0; i<$ROW; i++ ))
	 do
		for (( j=0; j<$COLUMN; j++ ))
		 do
			if [[ $i == $j && ${Board[$i,$j]} == "$checkSign" ]]
          then
            ((leftDiCounter++))
			fi
			if [[ $i == $j && ${Board[$i,$j]} != "$checkSign" ]]
			 then
				leftDiRow=$i
				leftDiCol=$j
			fi
		 done
	 done
	if [[ $leftDiCounter == $(($ROW-1)) && ${Board[$leftDiRow,$leftDiCol]} != "$prevSign" && ${Board[$leftDiRow,$leftDiCol]} != "$playerSign" ]]
	 then
		Board[$leftDiRow,$leftDiCol]=$playerSign
		flagForSwitchFunctions=1
		return
	fi
}
function rightDiagonalChecker() {
	local rightDiCounter=0
	local currentRow=0
	local rightDiRow=0
	local rightDiCol=0
   for (( i=0; i<$ROW; i++ ))
    do
		currentRow=i
      for (( j=0; j<$COLUMN; j++ ))
       do
			if [[ $j == $(($ROW-$currentRow-1)) && ${Board[$i,$j]} == "$checkSign" ]]
	 		 then
				((rightDiCounter++))
			fi
			if [[ $j == $(($ROW-$currentRow-1)) && ${Board[$i,$j]} != "$checkSign" ]]
			 then
				rightDiRow=$i
				rightDiCol=$j
			fi
		 done
	 done
	if [[ $rightDiCounter == $(($ROW-1)) && ${Board[$rightDiRow,$rightDiCol]} != "$prevSign" && ${Board[$rightDiRow,$rightDiCol]} != "$playerSign" ]]
	 then
		Board[$rightDiRow,$rightDiCol]=$playerSign
		flagForSwitchFunctions=1
		return
	fi
}
function cornerCheck() {
	for (( i=0; i<$((ROW*ROW)); i++ ))
	 do
		if [[ $i == $((ROW-ROW)) || $i == $((ROW-1)) || $i == $((ROW*ROW-ROW)) || $i == $((ROW*ROW-1)) ]]
		 then
			if [[ ${Board[$((i/ROW)),$((i%ROW))]} != "$prevSign" && ${Board[$((i/ROW)),$((i%ROW))]} != "$playerSign" ]]
			 then
				Board[$((i/ROW)),$((i%ROW))]=$playerSign
				flagForSwitchFunctions=1
				return
			fi
	 done
}
function centerCheck() {
	if [[ ${Board[$((ROW*ROW/2)),$((ROW*ROW%2))]} != "$prevSign" && ${Board[$((ROW*ROW/2)),$((ROW*ROW%2))]} != "$playerSign" ]]
	 then
		Board[$((ROW*ROW/2)),$((ROW*ROW%2))]= $playerSign
		flagForSwitchFunctions=1
		return
	fi
}
function computerPlay() {

checkSign=$playerSign
		rowChecker
if [[ $flagForSwitchFunctions == 1 ]]
 	 then
		return
fi
		columnChecker
if [[ $flagForSwitchFunctions == 1 ]]
 	 then
		return
fi
		leftDiagonalChecker
if [[ $flagForSwitchFunctions == 1 ]]
	 then
		return
fi
		rightDiagonalChecker
if [[ $flagForSwitchFunctions == 1 ]]
	 then
		return
fi
#blocking
checkSign=$prevSign
      rowChecker
if [[ $flagForSwitchFunctions == 1 ]]
    then
      return
fi
      columnChecker
if [[ $flagForSwitchFunctions == 1 ]]
    then
      return
fi
      leftDiagonalChecker
if [[ $flagForSwitchFunctions == 1 ]]
    then
      return
fi
      rightDiagonalChecker
if [[ $flagForSwitchFunctions == 1 ]]
    then
      return
fi
#corners
		cornerCheck
if [[ $flagForSwitchFunctions == 1 ]]
	then
		return
fi
#center
	centerCheck
if [[ $flagForSwitchFunctions == 1 ]]
   then
      return
fi
#sides
	for ((i=0; i<$ROW; i++))
    do
      for ((j=0; j<$COLUMN; j++))
       do
         if [[ ${Board[$i,$j]} == "1" || ${Board[$i,$j]} == "3" || ${Board[$i,$j]} == "5" || ${Board[$i,$j]} == "7" ]]
          then
            Board[$i,$j]=$playerSign
            return
         fi
       done
    done
}
function playerPlay() {
	read -p "Enter your position: " uPosition
	newRI=$(($uPosition / $ROW))
	newCI=$(($uPosition % $COLUMN))
	Board[$newRI,$newCI]=$playerSign
}
function startGame() {
	local p=0
	if [[ $Turn == "Player" ]]; then
		p=0
		printf "$Turn will play first"
		printf "\n"
 	 elif [[ $Turn == "Computer" ]]; then
		p=1
		printf "$Turn will play first"
		printf "\n"
	fi
	while [[ $n -lt 9 ]]
	 do
		prevSign=$playerSign
		if [[ $(($p % 2)) -eq 0 ]]; then
			playerSign=$( assignLetter )
			playerPlay
		 else
			flagForSwitchFunctions=0
			playerSign=$( assignLetter )
			computerPlay
		fi
		displayBoard
		TicTacToeApp
		((n++))
      ((p++))
	 done
}
buildTheBoard
displayBoard
Turn=$( whoPlays )
startGame
