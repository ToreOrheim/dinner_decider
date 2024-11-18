#!/bin/bash

DB_FILE="database.db"
SCHEMA_FILE="schema.sql"

# Check if the SQLite command-line tool is installed
if ! command -v sqlite3 &>/dev/null; then
    echo "Error: sqlite3 is not installed. Please install SQLite and try again."
    exit 1
fi

# Check if schema file exists
if [ ! -f "$SCHEMA_FILE" ]; then
    echo "Error: Schema file $SCHEMA_FILE not found."
    exit 1
fi

# If database does not exist, create it and apply the schema
if [ ! -f "$DB_FILE" ]; then 
    echo "Creating SQLite database: $DB_FILE"
    sqlite3 "$DB_FILE" < "$SCHEMA_FILE"
else
    echo "Using existing SQLite database"
fi

# Check if the database was created successfully
if [ $? -eq 0 ]; then
    echo "Database initialized successfully."
else
    echo "Error initializing database."
    exit 1
fi
