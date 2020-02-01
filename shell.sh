#!/bin/bash -x

echo "welcome to Snake and Ladder game"

INITIAL_POSITION=0;
WINNING_POSITION=20;
NUMBEROFPLAYER=1;
firstPlayerPosition=$INITIAL_POSITION;
NOPLAY=0;
LADDER=1;
SNAKE=2; 


function moveCondition(){

	if [ $1 -le 0 ]
	then
		echo firstPlayerPosition=$INITIAL_POSITION;
	elif [ $1 -eq $WINNING_POSITION ]
	then
		echo "win" $1 $WINNING_POSITION
	elif [ $1 -gt $WINNING_POSITION ]
	then
		firstPlayerPosition=$(( $1 - $2 ))
		echo " greater than Wiining position " $firstPlayerPosition
	fi 
}


while [ $firstPlayerPosition -lt $WINNING_POSITION ]
do
	randomDieMove=$((RANDOM%6+1))
	Option=$((RANDOM%3))
	case $Option in
	$NOPLAY)
		echo " random no play  move " $randomDieMove
		echo " no play" $firstPlayerPosition
		firstPlayerPosition=$firstPlayerPosition
		;;

	$LADDER)
		echo " ladder move " $randomDieMove
		echo "Ladder" $firstPlayerPosition
		firstPlayerPosition=$(( $firstPlayerPosition + $randomDieMove ))
		;;
	$SNAKE)
	echo "random snake move" $randomDieMove
		echo "Anake" $firstPlayerPosition
		firstPlayerPosition=$(( $firstPlayerPosition - $randomDieMove ))
		;;

	esac
	 moveCondition $firstPlayerPosition $randomDieMove

done



