#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

########
# FAF Unit Database setup script
# Burke Lougheed
# Created 2016-10-23

########
# Validation and initialization
#
# ensure one paremeter is provided:
if [ "$#" -ne 1 ]; then
  # dun goofed; provide usage and example
  echo "ERROR: 1 parameter required"
  echo "USAGE: ./setup_database.sh [DATABASE SERVER]"
  echo "EXAMPLE: ./setup_database.sh localhost"
  echo "MESSAGE: Ensure your .pgpass file is configured correctly for your chosen server."
  exit 1
else
  # initialize variables
  db_server=$1
fi
# create the database from scratch
echo "Creating database..."
psql -h "$db_server" -f lib/create_db.sql -e

# create the faf_units schema
echo "Creating schema..."
psql -h "$db_server" -d faf_units -f lib/create_schema.sql -e

# done
echo -e "\nDatabase created successfully as \"faf_units\" on $db_server\n"