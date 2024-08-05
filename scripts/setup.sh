#!/bin/bash

GAS_DIR="./gas"

# Create Root Folder gas if not created
if [ ! -d $GAS_DIR ]; then
    mkdir $GAS_DIR
fi

# Read the name property from package.json
name=$(grep '"name"' package.json | sed -E 's/.*"name": "([^"]+)".*/\1/')

# Print the name
echo $name

# Remove existing clasp.json
rimraf .clasp.json

# Create dist dir
mkdirp dist

# Create new project
clasp create --type sheets --title $name --rootDir ./gas

mv ./gas/.clasp.json ./.clasp.json

# rimraf dist
