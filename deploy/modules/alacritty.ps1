#-------------------------------------------------------------------------------
# Deploy alacritty
#-------------------------------------------------------------------------------

# Script directory
$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

# Imports
. "$base_dir\utils\fs.ps1"

# Deploy
force_copy `
    -source "$base_dir\config\alacritty\alacritty.toml" `
    -destination "$env:APPDATA\alacritty\alacritty.toml"