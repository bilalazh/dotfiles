#!/bin/bash

# Check if the user provided the .deb file path
if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_aionui_deb_file>"
    exit 1
fi

# Get the absolute path of the provided file
DEB_FILE=$(realpath "$1")

# Verify the file exists
if [ ! -f "$DEB_FILE" ]; then
    echo "Error: File '$DEB_FILE' not found!"
    exit 1
fi

# Define the target installation directory
INSTALL_DIR="$HOME/.local/share/AionUi"

echo "Starting minimal AionUi installation..."

# 1. Create a secure temporary working directory and move into it
TEMP_DIR=$(mktemp -d -t aion_install_XXXXXX)
cd "$TEMP_DIR" || exit

# 2. Copy the .deb file into the temp directory
cp "$DEB_FILE" ./aionui_app.deb

# 3. Extract the .deb file and its data archive
echo "Extracting the Debian package..."
ar x ./aionui_app.deb
tar -xf data.tar.*

# 4. Prepare the local share directory and move the app data
echo "Moving application files to $INSTALL_DIR..."
rm -rf "$INSTALL_DIR"
mkdir -p "$(dirname "$INSTALL_DIR")"
mv opt/AionUi "$INSTALL_DIR"

# 5. Ensure the main binary has execution permissions
chmod +x "$INSTALL_DIR/AionUi"

# 6. Clean up the temporary folder
echo "Cleaning up temporary files..."
cd "$HOME" || exit
rm -rf "$TEMP_DIR"

echo "=================================================="
echo "Done! AionUi has been installed to:"
echo "$INSTALL_DIR/AionUi"
echo "You can now map your custom alias to this path."
