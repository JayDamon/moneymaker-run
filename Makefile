PLAID_BINARY=plaidIntegration
USER_BINARY=userService

up:
	@echo "Starting Docker images..."
	docker compose up -d
	@echo "Docker images started!"

up-t: build_transaction
	docker compose up --build -d

up_build: build
	@echo "Stopping docker images (if running...)"
	docker compose down
	@echo "Building (when required) and starting docker images..."
	docker compose up --build -d
	@echo "Docker images built and started!"

build: build_pi build_user build_transaction build_account build_budget build_admin build_gateway

build_pi:
	@echo "Building build plaid integration binary..."
	cd ../plaid-integration && env GOOS=linux CGO_ENABLED=0 go build -o ${PLAID_BINARY} ./cmd/main
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

down:
	@echo "Stopping docker compose..."
	docker compose down
	@echo "Done!"