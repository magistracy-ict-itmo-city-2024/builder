build:
	cd backend && ./gradlew :server:standalone:bootJar && docker build ./ -t city24-backend-core
	docker save --output city24-backend-core.tar city24-backend-core
	cd ml && docker build ./ -t city24-ml-core
	docker save --output city24-ml-core.tar city24-ml-core
	cd frontend && docker build ./ -t city24-frontend-core
	docker save --output city24-frontend-core.tar city24-frontend-core


build-backend:
	cd backend && ./gradlew :server:standalone:bootJar && docker build ./ -t city24-backend-core
	docker save --output city24-backend-core.tar city24-backend-core

build-ml:
	cd ml && docker build ./ -t city24-ml-core
	docker save --output city24-ml-core.tar city24-ml-core

build-frontend:
	cd frontend && docker build ./ -t city24-frontend-core
	docker save --output city24-frontend-core.tar city24-frontend-core

run:
	cat city24-backend-core.tar | docker load
	cat city24-ml-core.tar | docker load
	cat city24-frontend-core.tar | docker load
	docker compose up -d