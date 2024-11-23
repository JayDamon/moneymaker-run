#!/bin/bash

directories=("./keycloak" "./rabbitmq" "./rabbitmq/etc" "./rabbitmq/data" "./rabbitmq/logs" "./account-service" "./budget-service" "./transaction-service" "./transaction-service-deprecated" "./user-service")

for i in "${directories[@]}";
do
  if [ ! -d "$i" ]
  then 
    echo "Directory $i does not exists. Creating..."
    mkdir $i
  else
    echo "Directory $i already exists. Skipping."
  chmod -R 777 $i
  fi
done

chmod -R 777 ./rabbitmq/logs

echo "Completed creating required directories"
