#!/bin/bash

BASE_DIR=$(pwd)

create_file () {
	TEMP=""
	printf -v TEMP "%s%s" $1 $2
	if [ ! -f "$TEMP" ]; then
		cat $BASE_DIR/templates/$2 > $TEMP
		echo "$TEMP does not already exist, creating"
	fi
}

while read p; do
	cd $BASE_DIR
	NAME=$(echo $p | sed 's/ //g')
	if [ ! -d "$NAME" ]; then
		mkdir $NAME
		echo "$NAME does not already exist, creating"
	fi
	cd $NAME
	create_file $NAME "Test.txt"	
	create_file $NAME "Útok.txt"	
	create_file $NAME "Zraniťelnosť.txt"	
done <tests.txt


