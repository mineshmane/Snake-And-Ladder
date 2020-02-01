#!/bin/bash 

echo "welcome to Snake and Ladder game"

INITIAL_POSITION=0;
WINNING_POSITION=100;
NUMBER_OF_PLAYER=1;
firstPlayerPosition=$INITIAL_POSITION;
NOPLAY=0;
LADDER=1;
SNAKE=2; 
diceCounter=0;

declare -A position
function moveCondition(){

	if [ $1 -le 0 ]
	then
		echo firstPlayerPosition=$INITIAL_POSITION;
	elif [ $1 -eq $WINNING_POSITION ]
	then
		echo win
	elif [ $1 -gt $WINNING_POSITION ]
	then
		firstPlayerPosition=$(( $1 - $2 ))
	fi 
}


while [ $firstPlayerPosition -lt $WINNING_POSITION ]
do
	randomDieMove=$((RANDOM%6+1))
	diceCounter=$(( $diceCounter + 1 ))
	Option=$((RANDOM%3))
	case $Option in
	$NOPLAY)
		firstPlayerPosition=$firstPlayerPosition
		;;

	$LADDER)
		firstPlayerPosition=$(( $firstPlayerPosition + $randomDieMove ))
		;;
	$SNAKE)
		firstPlayerPosition=$(( $firstPlayerPosition - $randomDieMove ))
		;;

	esac
	 moveCondition $firstPlayerPosition $randomDieMove
 	 position[$diceCounter]=$firstPlayerPosition
done

for dies in "${position[@]}"
do
	echo $dies "position :" ${position[$dies]}
done



