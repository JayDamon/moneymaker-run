#!/bin/bash

git clone git@github.com:JayDamon/account-service.git ../account-service
git clone git@github.com:JayDamon/admin-service.git ../admin-service
git clone git@github.com:JayDamon/budget-service.git ../budget-serivce
git clone git@github.com:JayDamon/http-toolbox.git ../http-toolbox
git clone git@github.com:JayDamon/moneymaker-api-gateway-service.git ../moneymaker-api-gateway-service
git clone git@github.com:JayDamon/moneymaker-react-client.git ../moneymaker-react-client
git clone git@github.com:JayDamon/moneymakergocloak.git ../moneymakergocloak
git clone git@github.com:JayDamon/plaid-integration.git ../plaid-integration
git clone git@github.com:JayDamon/transaction-service.git ../transaction-service
git clone git@github.com:JayDamon/user-service.git ../user-service

cd ./data

./setup.sh

