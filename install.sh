#!/bin/bash

# Get the current directory as an absolute path
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

# 0.1 Download files
wget "https://github.com/Gcenx/macOS_Wine_builds/releases/download/11.0-rc4/wine-staging-11.0-rc4-osx64.tar.xz"
wget -O "setup_project64.exe" "https://www.pj64-emu.com/download/project64-3-0-1-installer"

# 1. Create the directory
echo "Making the directory for the Wine prefix..."
mkdir -p "$BASE_DIR/wine_data"

# 2. Extract wine (if not already done)
if [ ! -d "$BASE_DIR/Wine Staging.app" ]; then
    echo "Extracting wine..."
    tar -xzf wine-staging-11.0-rc4-osx64.tar.xz
fi

# 3. Info Message
/usr/bin/osascript <<-EOF
    tell application "System Events"
        activate
        display dialog "Please select the default options in the next installer window"
    end tell
EOF

# 4. Set Environment Variables
export WINEPREFIX="$BASE_DIR/wine_data"
# This helps with memory errors on M1 Macs:
export WINEDEBUG="-all" 

echo "Starting installation..."

# 5. Run the installer using the ABSOLUTE path to the exe
# We use the exact filename found in your logs
"$BASE_DIR/Wine Staging.app/Contents/MacOS/wine" "$BASE_DIR/setup_project64.exe"