#!/bin/bash

# Download all files attached to a Zenodo record

set -e

# Print input info
usage() {
	echo Downloading Record "$RECORD_ID" to "$DL_DIR"
      }
# Report error and exit
perror() {
	echo Error: "$1" >&2
	exit 1
}

# Check if all params are supplied
if [ "$#" -eq 0 ]; then
	perror "Missing parameters"
	exit 1
fi

# Parameters
while [[ "$#" -gt 0 ]]; do
	case $1 in
		-i|--id) RECORD_ID="$2";
			shift;shift;;
		-d|--dir) DL_DIR="$2";
			shift;shift;;
		*) echo Unknown parameter passed: "$1";
			exit 1;
	esac;
	if [[ -z $RECORD_ID ]]
		then	
			echo "Error: Record ID must be declared (-i, --id)"
			exit 1
	fi
done

if [[ -z $DL_DIR ]]
	then
		DL_DIR="zenodo_files.txt"; 
	else
		DL_DIR=$DL_DIR . "/zenodo_files.txt";
fi

# Check HTTP status

HTTP_STATUS="$(curl -ILs https://zenodo.org/record/"$RECORD_ID" | head -1 | sed 's/HTTP\/.* \([0-9]*\) .*/\1/')";

if [[ $HTTP_STATUS != 200 ]]
	then
		echo Record cannot be reached;
		echo Error \(HTTP: "$HTTP_STATUS"\);
	exit 1
fi

# Main

FILES="$(curl -X GET https://zenodo.org/record/"$RECORD_ID" | grep -o 'href=\"\/.*\/files\/.*\?download=1' | sed 's/href="//' | sort -u)";
FILE_NO="$(echo -n "$FILES" | grep -c '^')";

if [[ $FILE_NO -eq 0 ]]
	then
		echo No download links found;
	exit 1
fi

echo Found "$FILE_NO" files;

while IFS= read -r line
	do
		echo https://zenodo.org"$line";
		#wget https://zenodo.org/"$line";
done <<<$FILES

exit 0
