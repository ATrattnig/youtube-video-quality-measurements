#!/bin/bash

VIDEO=$1

echo 'VIDEO='$VIDEO

echo 'Start Uploading ..'

START=$(date +%s.%N)

ID="$(python youtubeAPI/upload_video.py --file $VIDEO)"

END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)

URL='https://www.youtube.com/watch?v='$ID

echo 'Upload finished. It took '$DIFF' Seconds.'
echo 'URL: '$URL

youtube-dl -q -F $URL > /dev/null 2>&1

while [[ $? -ne 0 ]]
do
	sleep 0.500
	youtube-dl -q -F $URL > /dev/null 2>&1
done

END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)

echo 'Processing finished. It took '$DIFF' Seconds.'

REPS=('')
numOfReps=0

while [[ "$numOfReps" -lt "2" ]]
do
	DLRESULT="$(youtube-dl -F $URL | grep 'DASH video')"
	for rep in "${REPS[@]}"
	do
	  DLRESULT="${DLRESULT/$rep/''}"
	done
	DLRESULT="$(echo "$DLRESULT" | grep 'DASH video')"

	while [[ $? -ne 0 ]]
	do
		sleep 0.500
		DLRESULT="$(youtube-dl -F $URL | grep 'DASH video')"
		for rep in "${REPS[@]}"
		do
		  DLRESULT="${DLRESULT/$rep/''}"
		done
		DLRESULT="$(echo "$DLRESULT" | grep 'DASH video')"
	done

	END=$(date +%s.%N)
	DIFF=$(echo "$END - $START" | bc)


	while read -r line ; do
		echo 'Representation '$numOfReps' ready. It took '$DIFF' Seconds.'
		echo "$line"
		REPS[$numOfReps]=${line%'video only'*}
		((numOfReps++))	
	done < <(echo "${DLRESULT}")
done

echo 'Deleting Video ..'
python youtubeAPI/delete_video.py --video-id $ID

echo 'Done.'
