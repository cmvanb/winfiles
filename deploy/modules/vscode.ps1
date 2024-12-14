#-------------------------------------------------------------------------------
# Deploy vscode
#-------------------------------------------------------------------------------

# Script directory
$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

# Imports
. "$base_dir\utils\fs.ps1"

# Deploy
# NOTE: The destination path is for a scoop installation, consider handling other locations.
$user_data_path = "$HOME\scoop\apps\vscode\current\data\user-data\User"

install `
    -source "$base_dir\config\vscode\settings.json" `
    -destination "$user_data_path\settings.json"
install `
    -source "$base_dir\config\vscode\keybindings.json" `
    -destination "$user_data_path\keybindings.json"