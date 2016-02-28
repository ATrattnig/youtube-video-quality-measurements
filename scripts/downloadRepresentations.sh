#!/bin/bash

URL=$1
OUTPUTDIR=$2

echo 'Input URL='$URL
echo 'Output Dir='$OUTPUTDIR

mkdir -p $OUTPUTDIR

echo 'Parsing mpd and saving it to '$OUTPUTDIR'/manifest.mpd ..'
wget $(youtube-dl $URL --youtube-include-dash-manifest --dump-intermediate-pages -s | grep manifest.google | cut -d ' ' -f 5) -q -O $OUTPUTDIR'/manifest.mpd'
echo 'done.'

echo 'Saving youtubedl info to '$OUTPUTDIR'/youtubedlinfo.txt ..'
echo "$(youtube-dl -F $URL)" > $OUTPUTDIR'/youtubedlinfo.txt'
echo 'done.'

DLRESULT="$(youtube-dl -F $URL | grep 'DASH video')"
DLRESULT="${DLRESULT//,}"

echo "Downloading representations .."
echo "${DLRESULT}" | while read -r line ; do
    arrResults=($line)

    outputName="$(youtube-dl -s --get-filename -f ${arrResults[0]} -o "$OUTPUTDIR/%(format_id)s_%(width)sx%(height)s.%(ext)s" $URL)"

    youtube-dl --continue -f ${arrResults[0]} -o "$OUTPUTDIR/%(format_id)s_%(width)sx%(height)s.%(ext)s" $URL

    while [[ $? -ne 0 ]]
    do
	echo "Retrying download.."
        youtube-dl --continue -f ${arrResults[0]} -o "$OUTPUTDIR/%(format_id)s_%(width)sx%(height)s.%(ext)s" $URL
    done

    echo ${arrResults[0]}'	'${arrResults[1]}'	'${arrResults[2]}'	'${arrResults[5]}'	'${arrResults[6]}'	'${arrResults[7]}'	'${arrResults[10]}'	'$outputName
done
echo "done."






