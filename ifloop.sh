#!/bin/bash


if [ -z '$gap' ]; 
then 
echo -ne '0\t'; 
else 
echo -ne $gap'\t'; 
fi



#!/bin/sh



if [ -z "$gap" ] 
then
	echo "0\t" >> $outsummary
else
	echo $gap >> $outsummary
fi


and check the other lines so that the ‘\t’ is after the variable 
