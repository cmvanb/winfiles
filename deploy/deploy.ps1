#-------------------------------------------------------------------------------
# Deploy windows profile
#-------------------------------------------------------------------------------

# Bootstrapping
#-------------------------------------------------------------------------------

# Script directory
$base_dir = Resolve-Path -Path "$PSScriptRoot\.."

# Environment variables needed by deployment modules
$env:XDG_CONFIG_HOME = "$env:USERPROFILE\.config"

# Import deployment modules
Import-Module "$base_dir.\deploy\modules\alacritty" -Prefix alacritty_
Import-Module "$base_dir.\deploy\modules\git" -Prefix git_
Import-Module "$base_dir.\deploy\modules\nvim" -Prefix nvim_
Import-Module "$base_dir.\deploy\modules\powershell" -Prefix ps_
Import-Module "$base_dir.\deploy\modules\vscode" -Prefix vscode_
Import-Module "$base_dir.\deploy\modules\windows-terminal" -Prefix wt_

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