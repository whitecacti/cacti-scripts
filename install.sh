#!/bin/bash

# Set the directory path
WORKING_DIR="$HOME/.cacti-scripts"

rm -rf $WORKING_DIR
mkdir -p $WORKING_DIR
cp -r * $WORKING_DIR

echo "Select your shell configuration file:"
echo "1) ~/.zshrc (default)"
echo "2) ~/.bashrc"
read -p "Enter choice [1-3]: " choice

case $choice in
    1|"")
        RC_FILE="$HOME/.zshrc"
        ;;
    2)
        RC_FILE="$HOME/.bashrc"
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

echo ' ' >> "$RC_FILE"
echo '#Installing cacti-scripts' >> "$RC_FILE"

# Loop through all .zsh files in the directory
shopt -s nullglob
for config_file in "$WORKING_DIR"/zshrc/*.zsh; do
    CONFIG_LINE="source $config_file"

    # Check if already added to avoid duplicates
    if grep -Fxq "$CONFIG_LINE" "$RC_FILE"; then
        echo "  Skipped (already exists): $(basename "$config_file")"
    else
        echo "$CONFIG_LINE" >> "$RC_FILE"
        echo "  Added: $(basename "$config_file")"
    fi
done

# Run the custom shell scripts 
echo 'alias ip="$HOME/.cacti-scripts/shell_scripts/get_ip.sh"' >> "$RC_FILE"
chmod +x "$WORKING_DIR/shell_scripts/get_ip.sh"

echo "Configuration complete. Please restart your shell or run:"
echo source "$RC_FILE"