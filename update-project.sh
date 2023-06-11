#!/bin/bash

for d in ../*/ ; do
	cd $d
	echo "Performing git pull on $PWD"
	git pull
	echo "Update of $PWD complete"

  if [ -f "./mvnw" ]
  then
    pwd
    echo "mvnw file exists, taking over permissions"
    chmod +x "./mvnw"
  fi
done	
