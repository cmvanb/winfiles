#-------------------------------------------------------------------------------
# Deploy windows terminal
#-------------------------------------------------------------------------------

# Script directory
$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

# Imports
. "$base_dir\utils\fs.ps1"

# Deploy
install `
    -source "$base_dir\config\windows-terminal\settings.json" `
    -destination "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"