#!/bin/bash
set -x
files=`ls *.m`

for filename in $files
do
	#python ../matlab2python.py $file
	new_name=`echo $filename | tr 'm' 'p'`
	python ../matlab2python.py $filename -o"${new_name}y"

done
