# 0. Prerequisites

- Installed jdk 17
- Installed docker and make
- Cloned repository for backend https://github.com/magistracy-ict-itmo-city-2024/backend to `./backend`, for ml https://github.com/magistracy-ict-itmo-city-2024/ml to `./ml`, for frontend https://github.com/magistracy-ict-itmo-city-2024/frontend to frontend 

# 1. Build

Execute

```bash
make build
```

It will build docker images for backend and ml and save it as `city24-backend-core.tar` and `city24-ml-core.tar`.

# 2. Setup remote

## 2.1. Copy tar files to the server.

Copy tar files to the server.

## 2.2. Configure environment

Copy docker-compose-template.yml to docker-compose.yml and fill in the environment variables (whet to fill see below).

### 2.2.1. ML

For ML, you need to get token from https://huggingface.co/docs/hub/security-tokens and fill in the `HUGGINGFACE_TOKEN` variable.

### 2.2.2. Backend

For backend, you need to set up postgresql database. Fill in the `SPRING_DATASOURCE_USERNAME`, `SPRING_DATASOURCE_PASSWORD`, `SPRING_DATASOURCE_USERNAME` variables. Docker image includes CA certificate for Yandex Cloud Manages Postgresql, but you can configure connection to any another cluster (maybe needed to add your own certs).

And you should fill in the `JWT_SECRET_ACCESS` and `JWT_SECRET_REFRESH` variables with the 256bit secret keys for JWT. You can generate it from https://generate-random.org/encryption-key-generator?count=2&bytes=32&cipher=aes-256-cbc&string=&password= as example.

# 3. Run

After you have filled in the environment variables, and you have tar images for docker, you can run the following command:

```bash
make run
```