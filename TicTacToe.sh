
#!/bin/bash -x
#Problem Statement : Tic Tac Toe Game.
#Discription : This problem simulates as a Tic Tac Toe Player would like to challenge computer.
#Author : Kunal Jadhav
#Date : 9 March 2020
row=3
column=3
declare -A Board
n=0
prevSign=" "
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
function  buildTheBoard() {
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
	for ((i=0; i<$row; i++))
	 do
		currentRow=i
		for ((j=0; j<$column; j++))
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
			if [[ $j == $(($row-$currentRow-1)) && ${Board[$i,$j]} == "$playerSign" ]]
			 then
				((rightDiCounter++))
			fi
			if [[ $rowCounter == $column || $colCounter == $column || $leftDiCounter == $column || $rightDiCounter == $column ]]
			 then
					echo "$playerSign is Winner"
					displayBoard
					exit
			fi
			if [[ $j == $(($row-1)) ]]
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
function computerPlay() {
if [[ ${Board[0,0]} == "$playerSign" && ${Board[0,1]} == "$playerSign" && ${Board[0,2]} == "2" ]]; then
      Board[0,2]=$playerSign
		return
    elif [[ ${Board[0,1]} == "$playerSign" && ${Board[0,2]} == "$playerSign" && ${Board[0,0]} == "0" ]]; then
      Board[0,0]=$playerSign
		return
    elif [[ ${Board[0,0]} == "$playerSign" && ${Board[0,2]} == "$playerSign" && ${Board[0,1]} == "1" ]]; then
      Board[0,1]=$playerSign
		return
    elif [[ ${Board[1,0]} == "$playerSign" && ${Board[1,1]} == "$playerSign" && ${Board[1,2]} == "5" ]]; then
     	Board[1,2]=$playerSign
		return
    elif [[ ${Board[1,1]} == "$playerSign" && ${Board[1,2]} == "playerSign" && ${Board[1,0]} == "3" ]];  then
    	Board[1,0]=$playerSign
		return
    elif [[ ${Board[1,0]} == "$playerSign" && ${Board[1,2]} == "$playerSign" && ${Board[1,1]} == "4" ]]; then
     	Board[1,1]=$playerSign
		return
    elif [[ ${Board[2,0]} == "$playerSign" && ${Board[2,1]} == "$playerSign" && ${Board[2,2]} == "8" ]]; then
    	Board[2,2]=$playerSign
		return
 	 elif [[ ${Board[2,1]} == "$playerSign" && ${Board[2,2]} == "$playerSign" && ${Board[2,0]} == "6" ]]; then
     	Board[2,0]=$playerSign
		return
    elif [[ ${Board[2,0]} == "$playerSign" && ${Board[2,2]} == "$playerSign" && ${Board[2,1]} == "7" ]]; then
      Board[2,1]=$playerSign
		return
	 elif [[ ${Board[0,0]} == "$playerSign" && ${Board[1,0]} == "$playerSign" && ${Board[2,0]} == "6" ]]; then
     	Board[2,0]=$playerSign
		return
	 elif [[ ${Board[1,0]} == "$playerSign" && ${Board[2,0]} == "$playerSign" && ${Board[0,0]} == "0" ]]; then
      Board[0,0]=$playerSign
		return
	 elif [[ ${Board[0,0]} == "$playerSign" && ${Board[2,0]} == "$playerSign" && ${Board[1,0]} == "3" ]]; then
     	Board[1,0]=$playerSign
		return
	 elif [[ ${Board[0,1]} == "$playerSign" && ${Board[1,1]} == "$playerSign" && ${Board[2,1]} == "7" ]]; then
     	Board[2,1]=$playerSign
		return
	 elif [[ ${Board[1,1]} == "$playerSign" && ${Board[2,1]} == "$playerSign" && ${Board[0,1]} == "1" ]]; then
     	Board[0,1]=$playerSign
		return
	 elif [[ ${Board[0,1]} == "$playerSign" && ${Board[2,1]} == "$playerSign" && ${Board[1,1]} == "4" ]]; then
     	Board[1,1]=$playerSign
		return
  	 elif [[ ${Board[0,2]} == "$playerSign" && ${Board[1,2]} == "$playerSign" && ${Board[2,2]} == "8" ]]; then
    	Board[2,2]=$playerSign
		return
	 elif [[ ${Board[1,2]} == "$playerSign" && ${Board[2,2]} == "$playerSign" && ${Board[0,2]} == "2" ]]; then
 	   Board[0,2]=$playerSign
		return
	 elif [[ ${Board[0,2]} == "$playerSign" && ${Board[2,2]} == "$playerSign" && ${Board[1,2]} == "5" ]]; then
     	Board[1,2]=$playerSign
		return
	 elif [[ ${Board[0,0]} == "$playerSign" && ${Board[2,2]} == "$playerSign" && ${Board[1,1]} == "4" ]]; then
      Board[1,1]=$playerSign
		return
	 elif [[ ${Board[0,0]} == "$playerSign" && ${Board[1,1]} == "$playerSign" && ${Board[2,2]} == "8" ]]; then
      Board[2,2]=$playerSign
		return
	 elif [[ ${Board[1,1]} == "$playerSign" && ${Board[2,2]} == "$playerSign" && ${Board[0,0]} == "0" ]]; then
      Board[0,0]=$playerSign
		return
	 elif [[ ${Board[2,0]} == "$playerSign" && ${Board[0,2]} == "$playerSign" && ${Board[1,1]} == "4" ]]; then
     	Board[1,1]=$playerSign
		return
	 elif [[ ${Board[2,0]} == "$playerSign" && ${Board[1,1]} == "$playerSign" && ${Board[0,2]} == "2" ]]; then
      Board[0,2]=$playerSign
		return
	 elif [[ ${Board[1,1]} == "$playerSign" && ${Board[0,2]} == "$playerSign" && ${Board[2,0]} == "6" ]]; then
      Board[2,0]=$playerSign
		return
#blocking
	 elif [[ ${Board[0,0]} == "$prevSign" && ${Board[0,1]} == "$prevSign" && ${Board[0,2]} == "2" ]]; then
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
	for ((i=0; i<row; i++))
	 do
		for ((j=0; j<column; j++))
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
for ((i=0; i<row; i++))
    do
      for ((j=0; j<column; j++))
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
Turn=$( whoPlays )
buildTheBoard
startGame
