#!/bin/sh

ZIPFILE=$(ls $HOME/Downloads/ | grep "UE$1")

if test -z "$ZIPFILE"
then
	echo "error: exercisefile not found"
	exit 1
else
	echo "Located Exercise: $ZIPFILE"
fi

SUBJECT=$2

mv "$HOME/Downloads/$ZIPFILE" "$HOME/School/"
echo "Moved $ZIPFILE to $HOME/School"
unzip "$HOME/School/$ZIPFILE" -d "$HOME/School/$SUBJECT/UE$1"


