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

  fi
done


#git clone git@github.com:JayDamon/account-service.git ../account-service
#git clone git@github.com:JayDamon/admin-service.git ../admin-service
#git clone git@github.com:JayDamon/budget-service.git ../budget-serivce
#git clone git@github.com:JayDamon/http-toolbox.git ../http-toolbox
#git clone git@github.com:JayDamon/moneymaker-api-gateway-service.git ../moneymaker-api-gateway-service
#git clone git@github.com:JayDamon/moneymaker-react-client.git ../moneymaker-react-client
#git clone git@github.com:JayDamon/moneymakergocloak.git ../moneymakergocloak
#git clone git@github.com:JayDamon/account-link-service.git ../account-link-service
#git clone git@github.com:JayDamon/transaction-service.git ../transaction-service
#git clone git@github.com:JayDamon/user-service.git ../user-service

echo "All repositories checked out. Setting up data folder..."

cd ./data || exit

./setup.sh

echo "Project setup complete"

