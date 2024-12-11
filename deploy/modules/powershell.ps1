#-------------------------------------------------------------------------------
# Deploy powershell
#-------------------------------------------------------------------------------

# Script directory
$base_dir = Resolve-Path -Path "$PSScriptRoot/../.."

# Imports
. "$base_dir/utils/fs.ps1"

# Deploy
# NOTE: PS5
force_copy -source "$base_dir/config/powershell/Profile.ps1" -destination "$HOME/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"
# NOTE: PS7
# force_copy -source "$base_dir/config/powershell/Profile.ps1" -destination "$HOME/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"