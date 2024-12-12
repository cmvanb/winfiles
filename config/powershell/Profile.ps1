# Environment variables
[System.Environment]::SetEnvironmentVariable('XDG_CACHE_HOME', $env:USERPROFILE + '\.cache', 'User')
[System.Environment]::SetEnvironmentVariable('XDG_DATA_HOME', $env:USERPROFILE + '\.local\share', 'User')
[System.Environment]::SetEnvironmentVariable('XDG_CONFIG_HOME', $env:USERPROFILE + '\.config', 'User')
[System.Environment]::SetEnvironmentVariable('PYTHONPYCACHEPREFIX', $env:USERPROFILE + '\.cache\python', 'User')

# XDG directories
# NOTE: Doesn't work on powershell 5.
# if(-not(Test-Path $env:XDG_CACHE_HOME)){
# 	mkdir $env:XDG_CACHE_HOME
# }
# if(-not(Test-Path $env:XDG_DATA_HOME)){
# 	mkdir $env:XDG_DATA_HOME
# }
# if(-not(Test-Path $env:XDG_CONFIG_HOME)){
# 	mkdir $env:XDG_DATA_HOME
# }

# Functions
function Set-Title() {
    $repo = git rev-parse --show-toplevel 2>$null
    if ($LASTEXITCODE -eq 0) {
        $repo = Split-Path -Leaf $repo
    } else {
        $repo = Split-Path -Leaf (Get-Location)
    }
    $host.UI.RawUI.WindowTitle = $repo
}

# Aliases
function cd_set_title { Set-Location -Path "$args"; Set-Title }
Set-Alias -Force -Option AllScope -Name cd -Value cd_set_title

function git_add { git add $args }
Set-Alias -Force -Option AllScope -Name ga -Value git_add

function git_add_all { git add -A }
Set-Alias -Force -Option AllScope -Name gaa -Value git_add_all

function git_branch { git branch -v }
Set-Alias -Force -Option AllScope -Name gb -Value git_branch

function git_commit { git commit -m $args }
Set-Alias -Force -Option AllScope -Name gc -Value git_commit

function git_commit_amend { git commit --amend }
Set-Alias -Force -Option AllScope -Name gca -Value git_commit_amend

function git_checkout { git checkout $args }
Set-Alias -Force -Option AllScope -Name gco -Value git_checkout

function git_diff { git diff }
Set-Alias -Force -Option AllScope -Name gd -Value git_diff

function git_diff_staged { git diff --staged }
Set-Alias -Force -Option AllScope -Name gds -Value git_diff_staged

function git_log { git log --pretty=history }
Set-Alias -Force -Option AllScope -Name gl -Value git_log

function git_push { git push $args }
Set-Alias -Force -Option AllScope -Name gp -Value git_push

function git_push_force { git push --force $args }
Set-Alias -Force -Option AllScope -Name gpf -Value git_push_force

function git_remote { git remote -v }
Set-Alias -Force -Option AllScope -Name gr -Value git_remote

function git_status { git status }
Set-Alias -Force -Option AllScope -Name gs -Value git_status

function git_status_untracked { git status -u }
Set-Alias -Force -Option AllScope -Name gsu -Value git_status_untracked

function list { eza -l }
Set-Alias -Force -Option AllScope -Name ls -Value list

function list_all { eza -al }
Set-Alias -Force -Option AllScope -Name lsa -Value list_all

function list_tree { eza -lT }
Set-Alias -Force -Option AllScope -Name lst -Value list_tree

function list_tree_all { eza -alT }
Set-Alias -Force -Option AllScope -Name lsta -Value list_tree_all

function path { Write-Output ($env:Path).Split(';') }
Set-Alias -Force -Option AllScope -Name p -Value path

Set-Alias -Force -Option AllScope -Name type -Value Get-Command

function virtual_env_enable { .\venv\Scripts\Activate.ps1 }
Set-Alias -Force -Option AllScope -Name va -Value virtual_env_enable

# Hooks
# NOTE: Doesn't work on powershell 5.
# Invoke-Expression "$(direnv hook pwsh)"

# Startup
Set-Title