#!/bin/bash

pushd Database
dotnet restore
dotnet build

touch ~/.bashrc
echo 'export PATH="$PATH:/var/www/.dotnet/tools"' >> ~/.bashrc
export PATH="$PATH:/var/www/.dotnet/tools"

# Try to connect to the database every 1 second over 120 seconds
dockerize -wait tcp://$DB_HOST:$DB_PORT -timeout 120s

dotnet ef database update
popd

dotnet watch --project Application/Application.csproj run -- --urls http://0.0.0.0:5000
