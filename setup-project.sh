#!/bin/bash

baseRepo="git@github.com:JayDamon"

services=(
"account-link-service"
"account-service"
"account-update-service"
"admin-service"
"budget-service"
"http-toolbox"
"moneymaker-api-gateway-service"
"moneymaker-client"
"moneymaker-react-client"
"moneymakergocloak"
"moneymakerplaid"
"moneymakerrabbit"
"service-discovery"
"transaction-service"
"user-service"
)

for i in "${services[@]}";
do
  dir="../$i"
  echo "$dir"
  if [ ! -d "$dir" ]
  then
    checkout="$baseRepo/$i.git $dir"
    echo "$i does not exist. Cloning repository $checkout..."
    git clone $checkout

    if [ -f "$dir/mvnw" ]
    then
      pwd
      echo "mvnw file exists, taking over permissions"
      chmod +x "$dir/mvnw"
    fi
  else
    currDir="$PWD"
    cd $dir
    echo "Performing git pull on $PWD"
    git pull
    echo "Update of $PWD complete"

    if [ -f "./mvnw" ]
    then
      pwd
      echo "mvnw file exists, taking over permissions"
      chmod +x "./mvnw"
    fi
    cd ../moneymaker-run
  fi
done

echo "All repositories up to date. Setting up data folder..."

cd ./data || exit

./setup.sh

echo "Project setup complete"

