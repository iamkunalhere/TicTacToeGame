#!/bin/bash -x
#Problem Statement : Tic Tac Toe Game.
#Discription : This problem simulates as a Tic Tac Toe Player would like to challenge computer.
#Author : Kunal Jadhav
#Date : 9 March 2020
ROW=3
COLUMN=3
declare -A Board
n=0
prevSign=" "
flagForSwitchFunctions=0
function displayBoard() {
	for (( i=0; i<$ROW; i++ ))
	 do
		echo "---------------"
		for (( j=0; j<$COLUMN; j++))
		 do
			printf "| ${Board[$i,$j]} |"
		 done
		printf "\n"
	 done
		echo "---------------"
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
	for ((i=0; i<$ROW; i++))
	 do
		for ((j=0; j<$COLUMN; j++))
		 do
			if [[ ${Board[$i,$j]} == "$playerSign" ]]
			 then
				((counter++))
			fi
			if [[ ${Board[$i,$j]} != "$playerSign" ]]
			 then
				putInRow=$i
				putInCol=$j
			fi
			if [[ $counter == $(($ROW-1)) && ${Board[$putInRow,$putInCol]} != $prevSign && ${Board[$putInRow,$putInCol]} != $playerSign  ]]
			 then
				Board[$putInRow,$putInCol]=$playerSign
				flagForSwitchFunctions=1
				return
			fi
		 done
		counter=0
	 done
}
function columnChecker() {
	for ((i=0; i<$ROW; i++))
    do
      for ((j=0; j<$COLUMN; j++))
       do
         if [[ ${Board[$j,$i]} == "$playerSign" ]]
          then
            ((counter++))
         fi
         if [[ ${Board[$j,$i]} != "$playerSign" ]]
          then
            putInRow=$j
            putInCol=$i
         fi
			if [[ $counter == $(($ROW-1)) && ${Board[$putInRow,$putInCol]} != $prevSign && ${Board[$putInRow,$putInCol]} != $playerSign  ]]
          then
            Board[$putInRow,$putInCol]=$playerSign
            flagForSwitchFunctions=1
            return
         fi
       done
      counter=0
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
			if [[ $i == $j && ${Board[$i,$j]} == "$playerSign" ]]
          then
            ((leftDiCounter++))
			fi
			if [[ $i == $j && ${Board[$i,$j]} != "$playerSign" ]]
			 then
				leftDiRow=$i
				leftDiCol=$j
			fi
		 done
	 done
	if [[ $leftDiCounter == $(($ROW-1)) && ${Board[$leftDiRow,$leftDiCol]} != $prevSign && ${Board[$leftDiRow,$leftDiCol]} != $playerSign ]]
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
			if [[ $j == $(($ROW-$currentRow-1)) && ${Board[$i,$j]} == "$playerSign" ]]
	 		 then
				((rightDiCounter++))
			fi
			if [[ $j == $(($ROW-$currentRow-1)) && ${Board[$i,$j]} != "$playerSign" ]]
			 then
				rightDiRow=$i
				rightDiCol=$j
			fi
		 done
	 done
	if [[ $rightDiCounter == $(($ROW-1)) && ${Board[$rightDiRow,$rightDiCol]} != $prevSign && ${Board[$rightDiRow,$rightDiCol]} != $playerSign ]]
	 then
		Board[$rightDiRow,$rightDiCol]=$playerSign
		flagForSwitchFunctions=1
		return
	fi
}
function computerPlay() {
		rowChecker
	if [[ $flagForSwitchFunctions == 1 ]]
 	 then
		return
 	 elif [[ $flagForSwitchFunctions == 0 ]]
 	 then
		columnChecker
 	 elif [[ $flagForSwitchFunctions == 1 ]]
 	 then
		return
	 elif [[ $flagForSwitchFunctions == 0 ]]
	 then
		leftDiagonalChecker
	 elif [[ $flagForSwitchFunctions == 1 ]]
	 then
		return
	 elif [[ $flagForSwitchFunctions == 0 ]]
	 then
		rightDiagonalChecker
	 elif [[ $flagForSwitchFunctions == 1 ]]
	 then
		return
	fi
#blocking
	if [[ ${Board[0,0]} == "$prevSign" && ${Board[0,1]} == "$prevSign" && ${Board[0,2]} == "2" ]]; then
      Board[0,2]=$playerSign
		return
    elif [[ ${Board[0,1]} == "$prevSign" && ${Board[0,2]} == "$prevSign" && ${Board[0,0]} == "0" ]]; then
      Board[0,0]=$playerSign
		return
    elif [[ ${Board[0,0]} == "$prevSign" && ${Board[0,2]} == "$prevSign" && ${Board[0,1]} == "1" ]]; then
      Board[0,1]=$playerSign
		return
    elif [[ ${Board[1,0]} == "$prevSign" && ${Board[1,1]} == "$prevSign" && ${Board[1,2]} == "5" ]]; then
      Board[1,2]=$playerSign
		return
    elif [[ ${Board[1,1]} == "$prevSign" && ${Board[1,2]} == "$prevSign" && ${Board[1,0]} == "3" ]]; then
      Board[1,0]=$playerSign
		return
    elif [[ ${Board[1,0]} == "$prevSign" && ${Board[1,2]} == "$prevSign" && ${Board[1,1]} == "4" ]]; then
      Board[1,1]=$playerSign
		return
    elif [[ ${Board[2,0]} == "$prevSign" && ${Board[2,1]} == "$prevSign" && ${Board[2,2]} == "8" ]]; then
      Board[2,2]=$playerSign
		return
    elif [[ ${Board[2,1]} == "$prevSign" && ${Board[2,2]} == "$prevSign" && ${Board[2,0]} == "6" ]]; then
      Board[2,0]=$playerSign
		return
    elif [[ ${Board[2,0]} == "$prevSign" && ${Board[2,2]} == "$prevSign" && ${Board[2,1]} == "7" ]]; then
      Board[2,1]=$playerSign
		return
    elif [[ ${Board[0,0]} == "$prevSign" && ${Board[1,0]} == "$prevSign" && ${Board[2,0]} == "6" ]]; then
      Board[2,0]=$playerSign
		return
    elif [[ ${Board[1,0]} == "$prevSign" && ${Board[2,0]} == "$prevSign" && ${Board[0,0]} == "0" ]]; then
      Board[0,0]=$playerSign
		return
    elif [[ ${Board[0,0]} == "$prevSign" && ${Board[2,0]} == "$prevSign" && ${Board[1,0]} == "3" ]]; then
      Board[1,0]=$playerSign
		return
    elif [[ ${Board[0,1]} == "$prevSign" && ${Board[1,1]} == "$prevSign" && ${Board[2,1]} == "7" ]]; then
      Board[2,1]=$playerSign
		return
    elif [[ ${Board[1,1]} == "$prevSign" && ${Board[2,1]} == "$prevSign" && ${Board[0,1]} == "1" ]]; then
      Board[0,1]=$playerSign
		return
    elif [[ ${Board[0,1]} == "$prevSign" && ${Board[2,1]} == "$prevSign" && ${Board[1,1]} == "4" ]]; then
      Board[1,1]=$playerSign
		return
    elif [[ ${Board[0,2]} == "$prevSign" && ${Board[1,2]} == "$prevSign" && ${Board[2,2]} == "8" ]]; then
      Board[2,2]=$playerSign
		return
    elif [[ ${Board[1,2]} == "$prevSign" && ${Board[2,2]} == "$prevSign" && ${Board[0,2]} == "2" ]]; then
      Board[0,2]=$playerSign
		return
    elif [[ ${Board[0,2]} == "$prevSign" && ${Board[2,2]} == "$prevSign" && ${Board[1,2]} == "5" ]]; then
      Board[1,2]=$playerSign
		return
    elif [[ ${Board[0,0]} == "$prevSign" && ${Board[2,2]} == "$prevSign" && ${Board[1,1]} == "4" ]]; then
      Board[1,1]=$playerSign
		return
    elif [[ ${Board[0,0]} == "$prevSign" && ${Board[1,1]} == "$prevSign" && ${Board[2,2]} == "8" ]]; then
      Board[2,2]=$playerSign
		return
    elif [[ ${Board[1,1]} == "$prevSign" && ${Board[2,2]} == "$prevSign" && ${Board[0,0]} == "0" ]]; then
      Board[0,0]=$playerSign
		return
    elif [[ ${Board[2,0]} == "$prevSign" && ${Board[0,2]} == "$prevSign" && ${Board[1,1]} == "4" ]]; then
      Board[1,1]=$playerSign
		return
	 elif [[ ${Board[2,0]} == "$prevSign" && ${Board[1,1]} == "$prevSign" && ${Board[0,2]} == "2" ]]; then
      Board[0,2]=$playerSign
		return
    elif [[ ${Board[1,1]} == "$prevSign" && ${Board[0,2]} == "$prevSign" && ${Board[2,0]} == "6" ]]; then
      Board[2,0]=$playerSign
		return
	fi
#corners
	for ((i=0; i<$ROW; i++))
	 do
		for ((j=0; j<$COLUMN; j++))
		 do
			if [[ ${Board[$i,$j]} == "0" || ${Board[$i,$j]} == "2" || ${Board[$i,$j]} == "6" || ${Board[$i,$j]} == "8" ]]
			 then
				Board[$i,$j]=$playerSign
				return
			fi
		 done
	 done
#center
	if [[ ${Board[1,1]} == "4" ]]
 	 then
		Board[1,1]=$playerSign
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
	newRI=$(($uPosition / 3))
	newCI=$(($uPosition % 3))
	Board[$newRI,$newCI]=$playerSign
}
function startGame() {
	local p=0
	if [[ $Turn == "Player" ]]; then
		p=0
		printf "$Turn will play first"
 	 elif [[ $Turn == "Computer" ]]; then
		p=1
		printf "$Turn will play first"
	fi
	while [[ $n -lt 9 ]]
	 do
		displayBoard
		prevSign=$playerSign
		if [[ $(($p % 2)) -eq 0 ]]; then
			playerSign=$( assignLetter )
			playerPlay
		 else
			playerSign=$( assignLetter )
			computerPlay
		fi
		TicTacToeApp
		((n++))
      ((p++))
	 done
}
buildTheBoard
Turn=$( whoPlays )
startGame
