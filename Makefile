ACCOUNT_LINK_BINARY=accountLink
USER_BINARY=userService
ACCOUNT_UPDATE_BINARY=accountUpdate
TRANSACTION_UPDATE_BINARY=transactionUpdate

up:
	@echo "Starting Docker images..."
	docker compose up -d
	@echo "Docker images started!"

down:
	@echo "Stopping docker compose..."
	docker compose down
	@echo "Done!"

up_build: build
	@echo "Stopping docker images (if running...)"
	docker compose down
	@echo "Building (when required) and starting docker images..."
	docker compose up --build -d
	@echo "Docker images built and started!"

build: build_account_link build_account_update build_user build_transaction build_account build_budget build_admin build_gateway build_discovery build_transaction_update

start_react:
	@echo "Starting react client..."
	cd ../moneymaker-react-client && npm  start
	@echo "Done!"

start_angular:
	@echo "Starting angular client..."
	cd ../moneymaker-client && npm start
	@echo "Done!"

build_account_link:
	@echo "Building build account link service binary..."
	cd ../account-link-service && env GOOS=linux CGO_ENABLED=0 go build -o ${ACCOUNT_LINK_BINARY} ./cmd/main
	@echo "Done!"

build_account_update:
	@echo "Building build account update service binary..."
	cd ../account-update-service && env GOOS=linux CGO_ENABLED=0 go build -o ${ACCOUNT_UPDATE_BINARY} ./cmd/main
	@echo "Done!"

build_transaction_update:
	@echo "Building build transaction update service binary..."
	cd ../transaction-update-service && env GOOS=linux CGO_ENABLED=0 go build -o ${TRANSACTION_UPDATE_BINARY} ./cmd/main
	@echo "Done!"

build_user:
	@echo "Building build User Service binary..."
	cd ../user-service && env GOOS=linux CGO_ENABLED=0 go build -o ${USER_BINARY} ./cmd/main
	@echo "Done!"

build_transaction:
	@echo "Building the Transaction Service..."
	cd ../transaction-service && ./mvnw clean package -DskipTests
	@echo "Transaction Service build complete!"

build_account:
	@echo "Building the Account Service..."
	cd ../account-service && ./mvnw clean package -DskipTests
	@echo "Account Service build complete!"

build_budget:
	@echo "Building the Budget Service..."
	cd ../budget-service && ./mvnw clean package -DskipTests
	@echo "Budget Service build complete!"

build_admin:
	@echo "Building the Admin Service..."
	cd ../admin-service && ./mvnw clean package -DskipTests
	@echo "Admin Service build complete!"

build_gateway:
	@echo "Building the Gateway Service..."
	cd ../moneymaker-api-gateway-service && ./mvnw clean package -DskipTests
	@echo "Gateway Service build complete!"

build_discovery:
	@echo "Building the Service Discovery Service..."
	cd ../service-discovery && ./mvnw clean package -DskipTests
	@echo "Service Discovery Service build complete!"

up_account_link:
	@echo "Starting Account Link Service Service..."
	docker compose up --build -d --force-recreate --no-deps account-link-service
	@echo "Done!"

up_account_update:
	@echo "Starting Account Update Service Service..."
	docker compose up --build -d --force-recreate --no-deps account-update-service
	@echo "Done!"

up_transaction_update:
	@echo "Starting Transaction Update Service Service..."
	docker compose up --build -d --force-recreate --no-deps transaction-update-service
	@echo "Done!"

up_user:
	@echo "Starting User Service..."
	docker compose up --build -d --force-recreate --no-deps user-service
	@echo "Done!"

up_transaction:
	@echo "Starting Transaction Service..."
	docker compose up --build -d --force-recreate --no-deps moneymaker-transaction-service
	@echo "Done!"

up_account:
	@echo "Starting the Account Service..."
	docker compose up --build -d --force-recreate --no-deps moneymaker-account-service
	@echo "Done!"

up_budget:
	@echo "Starting the Budget Service..."
	docker compose up --build -d --force-recreate --no-deps moneymaker-budget-service
	@echo "Done!"

up_admin:
	@echo "Starting the Admin Service..."
	docker compose up --build -d --force-recreate --no-deps admin-service
	@echo "Done!"

up_gateway:
	@echo "Starting the API Gateway Service..."
	docker compose up --build -d --force-recreate --no-deps gateway
	@echo "Done!"

up_discovery:
	@echo "Starting the Service Discovery Service..."
	docker compose up --build -d --force-recreate --no-deps discovery
	@echo "Done!"

up_build_account_link: build_account_link up_account_link

up_build_account_update: build_account_update up_account_update

up_build_transaction_update: build_transaction_update up_transaction_update

up_build_user: build_user up_user

up_build_transaction: build_transaction up_transaction

up_build_account: build_account up_account

up_build_budget: build_budget up_budget

up_build_admin: build_admin up_admin

up_build_gateway: build_gateway up_gateway

up_build_discovery: build_discovery up_discovery