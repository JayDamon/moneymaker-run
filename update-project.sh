#!/bin/bash

for d in ../*/ ; do
	cd $d
	echo "Performing git pull on $PWD"
	git pull
	echo "Update of $PWD complete"
done	
