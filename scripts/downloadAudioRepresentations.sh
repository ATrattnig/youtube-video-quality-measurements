#!/bin/bash

URL=$1
OUTPUTDIR=$2'/audio'

mkdir -p $OUTPUTDIR

DLRESULT="$(youtube-dl -F $URL | grep 'DASH audio')"
DLRESULT="${DLRESULT//,}"

#echo "Downloading representations .."
echo "${DLRESULT}" | while read -r line ; do
    arrResults=($line)

    outputName="$(youtube-dl -s --get-filename -f ${arrResults[0]} -o "$OUTPUTDIR/%(format_id)s_%(abr)skbs_%(acodec)s.%(ext)s" $URL)"

    youtube-dl -q --continue -f ${arrResults[0]} -o "$OUTPUTDIR/%(format_id)s_%(abr)skbs_%(acodec)s.%(ext)s" $URL

    while [[ $? -ne 0 ]]
    do
	#echo "Retrying download.."
        youtube-dl -q  --continue -f ${arrResults[0]} -o "$OUTPUTDIR/%(format_id)s_%(abr)skbs_%(acodec)s.%(ext)s" $URL
    done

    echo $line' '$outputName
done
#echo "done."






