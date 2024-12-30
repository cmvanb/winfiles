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
Import-Module "$base_dir\deploy\modules\bat" -Force -Prefix bat_
Import-Module "$base_dir\deploy\modules\eza" -Force -Prefix eza_
Import-Module "$base_dir\deploy\modules\git" -Force -Prefix git_
Import-Module "$base_dir\deploy\modules\nvim" -Force -Prefix nvim_
Import-Module "$base_dir\deploy\modules\powershell" -Force -Prefix ps_
Import-Module "$base_dir\deploy\modules\python" -Force -Prefix python_
Import-Module "$base_dir\deploy\modules\scripts" -Force -Prefix scripts_
Import-Module "$base_dir\deploy\modules\theme" -Force -Prefix theme_
Import-Module "$base_dir\deploy\modules\vscode" -Force -Prefix vscode_
Import-Module "$base_dir\deploy\modules\windows-terminal" -Force -Prefix wt_

# Deploy profile
#-------------------------------------------------------------------------------

# TODO: Add flag to skip python modules.

Write-Output "Deploying windows profile from ``$base_dir`` to ``$env:USERPROFILE``..."

# Deploy modules depended on by other modules.
ps_deploy
python_deploy
theme_deploy

# Deploy all other modules.
bat_deploy
eza_deploy
git_deploy
nvim_deploy
scripts_deploy
vscode_deploy
wt_deploy

Write-Output "Deployment complete."