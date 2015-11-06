#!/bin/bash

for case in $2/*
do
	model=`basename $case`

	echo ">>> Running code generation for $model model."

	$1 $case/$model.uml $case/gen/

	echo ">>> Copying implementation files."

	cp -r -v $case/impl/* $case/gen/code

	echo ">>> Building generated code."

	cd $case/gen/code

	make all

	out=`ls *.out`

	echo ">>> Running compiled $out."

	./$out

	cd ../../../..
done