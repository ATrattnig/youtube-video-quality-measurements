#!/bin/bash
OUTPUTDIR=$1
ORIGINALFILE=$2

echo 'Output Dir='$OUTPUTDIR
echo 'Original File='$ORIGINALFILE

files=""

for repDir in $OUTPUTDIR*video*mp4 ; do
		echo "$repDir"
		files="$files $repDir"
done

psnrResults="$(qpsnr -a avg_psnr --aopts fpa=100000 -r $ORIGINALFILE $files |& tail -1)"
arrPSNR=(${psnrResults//,/ })

ssimResults="$(qpsnr -a avg_ssim --aopts fpa=100000 -r $ORIGINALFILE $files |& tail -1)"
arrSSIM=(${ssimResults//,/ })

i=1
for repDir in $OUTPUTDIR*video*mp4 ; do
		echo $repDir'	'${arrPSNR[$i]}'	'${arrSSIM[$i]}
		((i++))
done


echo "done."