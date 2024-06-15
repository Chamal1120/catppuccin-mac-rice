#!/bin/bash

# Check if MacPorts is installed
if ! command -v port &> /dev/null; then
  echo "MacPorts is not installed. Please install MacPorts first."
  exit 1
fi

# Read the list of applications from the file
FILE="$HOME/.config/macports-list.txt"

if [ ! -f "$FILE" ]; then
  echo "Application list file $FILE not found!"
  exit 1
fi

# Install each application listed in the file
while IFS= read -r app; do
  if [[ ! -z "$app" ]]; then
    echo "Installing $app..."
    sudo port install "$app"
  fi
done < "$FILE"

echo "Installation of applications completed."

