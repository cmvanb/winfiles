#-------------------------------------------------------------------------------
# Deploy powershell
#-------------------------------------------------------------------------------

# Script directory
$base_dir = Resolve-Path -Path "$PSScriptRoot/../.."

# Imports
. "$base_dir/utils/fs.ps1"

# Deploy
safe_copy -source "$base_dir/config/powershell/Profile.ps1" -destination "$HOME/Documents/WindowsPowershell/Microsoft.PowerShell_profile.ps1"