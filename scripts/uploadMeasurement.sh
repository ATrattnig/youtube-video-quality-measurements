#!/bin/bash

VIDEO=$1
EXPECTEDREPS=$2

#echo 'VIDEO='$VIDEO
#echo 'EXPECTEDREPS='$EXPECTEDREPS

TMPVIDEO="/tmp/"$(date +%s.%N)".mp4"

MP4Box -quiet -add $VIDEO $TMPVIDEO > /dev/null 2>&1

START=$(date +%s.%N)

ID="$(python youtubeAPI/upload_video.py --file $TMPVIDEO)"

END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)

URL='https://www.youtube.com/watch?v='$ID

echo 'Upload '$DIFF' s'
#echo 'URL: '$URL

youtube-dl -q -F $URL > /dev/null 2>&1

while [[ $? -ne 0 ]]
do
	sleep 0.500
	youtube-dl -q -F $URL > /dev/null 2>&1
done

END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)

echo 'Processing '$DIFF' s'

REPS=('')
numOfReps=0

while [[ "$numOfReps" -lt $EXPECTEDREPS ]]
do
	DLRESULT="$(youtube-dl -F $URL | grep 'DASH')"
	for rep in "${REPS[@]}"
	do
	  DLRESULT="${DLRESULT/$rep/''}"
	done
	DLRESULT="$(echo "$DLRESULT" | grep 'DASH')"

	while [[ $? -ne 0 ]]
	do
		sleep 0.500
		DLRESULT="$(youtube-dl -F $URL | grep 'DASH')"
		for rep in "${REPS[@]}"
		do
		  DLRESULT="${DLRESULT/$rep/''}"
		done
		DLRESULT="$(echo "$DLRESULT" | grep 'DASH')"
	done

	END=$(date +%s.%N)
	DIFF=$(echo "$END - $START" | bc)


	while read -r line ; do
		echo "$line"' '$DIFF
		REPS[$numOfReps]=${line%'DASH'*}
		((numOfReps++))	
	done < <(echo "${DLRESULT}")
done

python youtubeAPI/delete_video.py --video-id $ID
rm $TMPVIDEO
