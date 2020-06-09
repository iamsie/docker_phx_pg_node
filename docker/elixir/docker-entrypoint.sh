#!/bin/bash
# fail if we error out
set "MIX_ENV=dev" && mix compile
# Wait for database to come up
# until psql -h db -U "postgres" -c '\q' 2>/dev/null; do
#   >&2 echo "Postgres is unavailable - sleeping"
#   sleep 1
# done
# Ensure we have the basics...
mix local.hex --force
mix local.rebar --force
mix deps.clean mime --build
mix deps.get
cd assets && npm install
cd ..
set -ex # prints each command and fails the script on first error

mix ecto.create || echo "Could not create database, assume it exist already"
mix ecto.migrate
exec mix phx.server
