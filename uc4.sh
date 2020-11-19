#! /bin/bash -x
echo " #### Welcome to Tic-Tac-Toe Game #### "
declare -a board
max_Cell=9 # Constant maximum cell
cell_Count=0  # Variable to count used cell
board=(1 2 3 4 5 6 7 8 9) # Reset board to start play
function displayBoard() # To display board
{
echo "  ------------"
		for (( i=0;i<7;i=i+3 ))
		do
				echo " | ${board[$i]} | ${board[$i+1]} | ${board[$i+2]} |"
				echo "  ------------"
		done
}
function  chooseplayer() # To assign symbol for player
{
		symbol=$((RANDOM%2))
		if [[ $symbol -eq 1 ]]
		then
				player="User"
				echo "Your symbol is X "
				user="X"
				computer="O"
		else
				player="Computer"
				echo "Your symbol is O "
				user="O"
				computer="X"
		fi
}
function showboard() # To know who play
{
   if [[ $player == "User" ]]
   then
      userPlay
	else
		computerPlay
   fi
}
#  For user play
function printboard()
{
player="User"
if [[ $cell_Count -lt $max_Cell ]]
then
  read -p "Enter Number Between 1 to 9:" position
  if [[ ${board[$position-1]} -eq $position ]]
  then
  board[$position-1]=$user
  ((cell_Count++))
displayBoard
else
echo "Invalid input"
fi
else
echo " it is free"
exit
fi
}

#  Main function call
displayBoard
chooseplayer
showboard
printboard
