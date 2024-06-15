#!/bin/bash

# Define the source and target paths for tmux
TMUX_SRC="$HOME/.config/tmux/.tmux.conf"
TMUX_TARGET="$HOME/.tmux.conf"

# Define the source and target paths for zshrc
ZSHRC_SRC="$HOME/.config/zsh/.zshrc"
ZSHRC_TARGET="$HOME/.zshrc"

# Function to create a symbolic link
create_symlink() {
  local SRC=$1
  local TARGET=$2

  if [ ! -f "$SRC" ]; then
    echo "Source file $SRC does not exist. Please check your configuration."
    return 1
  fi

  if [ -L "$TARGET" ]; then
    echo "Symbolic link $TARGET already exists."
  elif [ -e "$TARGET" ]; then
    # Backup the existing file
    mv "$TARGET" "$TARGET.bak"
    echo "Existing file $TARGET backed up as $TARGET.bak"
    ln -s "$SRC" "$TARGET"
    echo "Symbolic link created: $TARGET -> $SRC"
  else
    ln -s "$SRC" "$TARGET"
    echo "Symbolic link created: $TARGET -> $SRC"
  fi
}

# Create symbolic links
create_symlink "$TMUX_SRC" "$TMUX_TARGET"
create_symlink "$ZSHRC_SRC" "$ZSHRC_TARGET"

