#-------------------------------------------------------------------------------
# Deploy windows profile
#-------------------------------------------------------------------------------

# Bootstrapping
#-------------------------------------------------------------------------------

# Script directory
$base_dir = Resolve-Path -Path "$PSScriptRoot\.."

# Environment variables needed by deployment modules
$env:XDG_CONFIG_HOME = "$env:USERPROFILE\.config"

# Import dependencies
Import-Module "$base_dir.\utils\fs" -Force
Import-Module "$base_dir.\utils\system" -Force

# Import deployment modules
Import-Module "$base_dir.\deploy\modules\alacritty" -Force -Prefix alacritty_
Import-Module "$base_dir.\deploy\modules\git" -Force -Prefix git_
Import-Module "$base_dir.\deploy\modules\nvim" -Force -Prefix nvim_
Import-Module "$base_dir.\deploy\modules\powershell" -Force -Prefix ps_
Import-Module "$base_dir.\deploy\modules\vscode" -Force -Prefix vscode_
Import-Module "$base_dir.\deploy\modules\windows-terminal" -Force -Prefix wt_

# Deploy profile
#-------------------------------------------------------------------------------

Write-Output "Deploying windows profile from ``$base_dir`` to ``$env:USERPROFILE``..."

alacritty_deploy
git_deploy
nvim_deploy
ps_deploy
vscode_deploy
wt_deploy

Write-Output "Deployment complete."