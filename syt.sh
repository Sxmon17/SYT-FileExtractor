#!/bin/sh
ARGS=$(getopt -a --options e:s:t: --long "exercise:,subject:,title:" -- "$@")
eval set -- "$ARGS"
EXERCISE=""
SUBJECT=""
TITLE=""

while true; do
  case "$1" in
    -e|--exercise)
      EXERCISE="$2"
      shift 2;;
    -s|--subject)
      SUBJECT="$2"
      shift 2;;
    -t|--title)
      TITLE="$2"
      shift 2;;
    --)
      break;;
     *)
      printf "Unknown option %s\n" "$1"
      exit 1;;
  esac
done

ZIPFILE=$(ls $HOME/Downloads/ | grep "UE$EXERCISE")

if test -z "$ZIPFILE"
then
	echo "error: exercisefile not found"
	exit 1
else
	echo "located exercise: $ZIPFILE"
fi

echo "moving $ZIPFILE to $HOME/School"
mv "$HOME/Downloads/$ZIPFILE" "$HOME/School/"
echo "unzipping: $HOME/School/$ZIPFILE" 
unzip "$HOME/School/$ZIPFILE" -d "$HOME/School/$SUBJECT/UE${EXERCISE}_${TITLE}"
echo "deleting: $HOME/School/$ZIPFILE"
rm -rf "$HOME/School/$ZIPFILE"
