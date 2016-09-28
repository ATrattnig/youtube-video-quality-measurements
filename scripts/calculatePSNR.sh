#!/bin/bash

URL=$1
OUTPUTDIR=$2
ORIGINALFILE=$3

#echo 'Input URL='$URL
#echo 'Output Dir='$OUTPUTDIR
#echo 'Original File='$ORIGINALFILE

DLRESULT="$(youtube-dl -F $URL | grep 'DASH video')"
DLRESULT="${DLRESULT//,}"

files=""
while read -r line ; do
    arrResults=($line)

    outputName="$(youtube-dl -s --get-filename -f ${arrResults[0]} -o "$OUTPUTDIR/%(format_id)s_%(width)sx%(height)s.%(ext)s" $URL)"
    files="$files $outputName"
done < <(echo "${DLRESULT}")

echo "qpsnr -a avg_psnr --aopts fpa=100000 -r $ORIGINALFILE $files"
exit
psnrResults="$(qpsnr -a avg_psnr --aopts fpa=100000 -r $ORIGINALFILE $files |& tail -1)"
arrPSNR=(${psnrResults//,/ })

i=1
echo "${DLRESULT}" | while read -r line ; do
    arrResults=($line)

    outputName="$(youtube-dl -s --get-filename -f ${arrResults[0]} -o "$OUTPUTDIR/%(format_id)s_%(width)sx%(height)s.%(ext)s" $URL)"

    echo ${arrResults[0]}'	'${arrResults[1]}'	'${arrResults[2]}'	'${arrResults[5]}'	'${arrResults[6]}'	'${arrResults[7]}'	'${arrResults[10]}'	'$outputName'	'${arrPSNR[$i]}
    ((i++))
done
#echo "done."






