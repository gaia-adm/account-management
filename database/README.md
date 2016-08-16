# gaia-account-management-db

The PostgreSQL data backing for gaia-account-management

## Setup for development
1. docker volume create --name pgdata
2. docker build -t db .
3. docker run -d -v pgdata:/var/lib/postgresql/data db
