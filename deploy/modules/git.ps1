#-------------------------------------------------------------------------------
# Deploy git
#-------------------------------------------------------------------------------

# Script directory
$base_dir = Resolve-Path -Path "$PSScriptRoot/../.."

# Imports
. "$base_dir/utils/fs.ps1"

# Deploy
force_copy -source "$base_dir/config/git/.gitconfig" -destination "$HOME/.gitconfig"