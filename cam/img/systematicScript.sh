#!/bin/bash

for (( br=30; br<256; br+=50 )) do
	for ((con=0; con<11; con+=3)) do
		for ((sat=0; sat<201; sat+=50)) do
			for (( bl=0; bl<11; bl+=3)) do
				./systematicTest.sh $br $con $sat 25 $bl;
			done
		done
	done
done

