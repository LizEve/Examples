#!/bin/bash
outsummary=$1
# Creates header line to specify marginal likelihoods collected
echo -ne "Locus\t"	> $outsummary
echo -ne "Sequences\t"	>> $outsummary
echo -ne "Columns\t"	>> $outsummary
echo -ne "Dist_Pat\t"	>> $outsummary
echo -ne "Pars_Info\t"	>> $outsummary
echo -ne "Sing_Sites\t"	>> $outsummary
echo -ne "Cons_Sites\t" >> $outsummary
echo -ne "Chi2_Fail\t"	>> $outsummary
echo "Gaps_Ambig" >> $outsummary

#f=Reeder_DNA_ADNP.scleroglossa.constraint.log
#f=Reeder_DNA_AHR.scleroglossa.constraint.log

for f in *log
do

echo -ne ${f%%.*}'\t'	>> $outsummary

seq=`grep -w "sequences with" $f | awk '{print $3}'`

echo -ne $seq'\t'	>> $outsummary

col=`grep -w "columns" $f | awk '{print $6}'`'\t'

echo -ne $col'\t'	>> $outsummary      

dis=`grep -w "distinct" $f | awk '{print $8}'`'\t'

echo -ne $dis'\t'	>> $outsummary

par=`grep -w "parsimony-informative" $f | awk '{print $1}'`'\t'

echo -ne $par'\t'	>> $outsummary

sin=`grep -w "singleton" $f | awk '{print $3}'`'\t'

echo -ne $sin'\t'	>> $outsummary

con=`grep -w "constant" $f | awk '{print $6}'`'\t'

echo -ne $con'\t'	>> $outsummary

chi=`grep -w "sequences failed" $f | awk '{print $4}'`'\t'

echo -ne $chi'\t'	>> $outsummary

gap=`grep -w "sequences contain" $f | awk '{print $2}'`

if [ -z "$gap" ] 
then
	echo "0"	>> $outsummary
else
	echo $gap	>> $outsummary
fi

done
