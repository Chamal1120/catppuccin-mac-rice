#!/bin/bash

# Directory where the scripts are located
SCRIPTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/scripts"

# Run each script sequentially
echo "Running setup.sh..."
"$SCRIPTS_DIR/setup.sh"

echo "Running install-macports.sh..."
"$SCRIPTS_DIR/install-macports.sh"

echo "Running install-nerd-fonts.sh..."
"$SCRIPTS_DIR/install-nerd-fonts.sh"

echo "All scripts executed."

