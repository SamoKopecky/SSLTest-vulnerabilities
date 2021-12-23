#!/bin/bash

BASE_DIR=$(pwd)
while read p; do
	cd $BASE_DIR
	NAME=$(echo $p | sed 's/ //g')
	mkdir $NAME
	cd $NAME
	create_file $NAME "Test.txt"	
	create_file $NAME "Útok.txt"	
	create_file $NAME "Zraniťelnosť.txt"	
done <tests.txt

create_file () {
	TEMP=""
	printf -v TEMP "%s%s" $1 $2
	touch $TEMP
}

