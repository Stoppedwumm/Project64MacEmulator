#!/bin/bash

# 1. Get the absolute path of where this script is located
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

# 2. Set the Wine Prefix path (Absolute)
export WINEPREFIX="$BASE_DIR/wine_data"

# 3. Disable most logs to improve performance and reduce errors
export WINEDEBUG="-all"

# 4. Define the path to the Wine binary and the EXE
WINE_BIN="$BASE_DIR/Wine Staging.app/Contents/MacOS/wine"
PJ64_EXE="$WINEPREFIX/drive_c/Program Files (x86)/Project64 3.0/Project64.exe"

echo "Starting Project64..."

# 5. Run it! 
# We wrap paths in quotes to handle the spaces and parentheses
"$WINE_BIN" "$PJ64_EXE"
