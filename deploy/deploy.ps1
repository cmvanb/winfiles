#-------------------------------------------------------------------------------
# Deploy windows profile
#-------------------------------------------------------------------------------

# Bootstrapping
#-------------------------------------------------------------------------------

# Script directory
$base_dir = Resolve-Path -Path "$PSScriptRoot/.."

# Environment variables needed by deployment modules
$env:XDG_CONFIG_HOME = "$HOME\.config"

# Deploy profile
#-------------------------------------------------------------------------------

Write-Output "Deploying windows profile from ``$base_dir`` to ``$HOME``..."

# Configuration files

# Alacritty
. "$base_dir\deploy\modules\alacritty.ps1"

# Git
. "$base_dir\deploy\modules\git.ps1"

# Powershell
. "$base_dir\deploy\modules\powershell.ps1"

# VSCode
. "$base_dir\deploy\modules\vscode.ps1"