#-------------------------------------------------------------------------------
# Deploy vscode
#-------------------------------------------------------------------------------

# Script directory
$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

# Imports
. "$base_dir\utils\fs.ps1"

# Deploy
# NOTE: The destination path is for a scoop installation, consider handling other locations.
force_copy `
    -source "$base_dir\config\vscode\settings.json" `
    -destination "$HOME\scoop\apps\vscode\current\data\user-data\User\settings.json"