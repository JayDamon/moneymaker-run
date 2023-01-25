#!/bin/bash

KEYCLOAK="./keycloak/"

directories=("./keycloak" "./rabbitmq" "./rabbitmq/etc" "./rabbitmq/data" "./rabbitmq/logs" "./account-service" "./budget-service" "./transaction-service" "./user-service")

for i in ${directories[@]};
do
  if [ ! -d "$i" ]
  then 
    echo "Directory $i does not exists. Creating..."
    mkdir $i
  else
    echo "Directory $i already exists. Skipping."
  fi
done

chmod -R 777 ./rabbitmq/logs

echo "Completed creating required directories"