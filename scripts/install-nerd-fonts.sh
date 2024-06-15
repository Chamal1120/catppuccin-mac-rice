#!/bin/bash

# Define the source directory where the font files are located
FONT_SRC_DIR="$HOME/.config/.fonts"

# Define the target directory where the fonts will be installed
FONT_TARGET_DIR="$HOME/Library/Fonts"

# Check if the source directory exists
if [ ! -d "$FONT_SRC_DIR" ]; then
  echo "Source directory $FONT_SRC_DIR not found!"
  exit 1
fi

# Create the target directory if it doesn't exist
if [ ! -d "$FONT_TARGET_DIR" ]; then
  mkdir -p "$FONT_TARGET_DIR"
  echo "Created directory $FONT_TARGET_DIR"
fi

# Copy all font files to the target directory
cp "$FONT_SRC_DIR"/* "$FONT_TARGET_DIR"

# Verify the fonts were copied
if [ $? -eq 0 ]; then
  echo "Fonts installed successfully to $FONT_TARGET_DIR"
else
  echo "Failed to install fonts"
fi

