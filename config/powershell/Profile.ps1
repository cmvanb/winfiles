#-------------------------------------------------------------------------------
# PowerShell profile
# NOTE: Shared between powershell and pwsh.
#-------------------------------------------------------------------------------

# Bootstrapping
#-------------------------------------------------------------------------------

# Imports
Import-Module -Force "utils\fs"
Import-Module -Force "utils\system"
Import-Module -Force "scripts\print-environment"

# Environment variables
set_env_var 'XDG_BIN_HOME' "$env:USERPROFILE\.local\bin"
set_env_var 'XDG_CACHE_HOME' "$env:USERPROFILE\.cache"
set_env_var 'XDG_CONFIG_HOME' "$env:USERPROFILE\.config"
set_env_var 'XDG_DATA_HOME' "$env:USERPROFILE\.local\share"
set_env_var 'XDG_SCRIPTS_HOME' "$env:USERPROFILE\.local\scripts"
set_env_var 'PYTHONPYCACHEPREFIX' "$env:USERPROFILE\.cache\python"
set_env_var 'STARSHIP_CONFIG' "$env:USERPROFILE\.config\starship\starship.toml"

# XDG directories
ensure_directory $env:XDG_CACHE_HOME
ensure_directory $env:XDG_CONFIG_HOME
ensure_directory $env:XDG_DATA_HOME
ensure_directory $env:XDG_SCRIPTS_HOME

# Functions
#-------------------------------------------------------------------------------

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
#-------------------------------------------------------------------------------

function cd_set_title { Set-Location -Path "$args"; Set-Title }
Set-Alias -Force -Option AllScope -Name cd -Value cd_set_title

function clear_screen { Clear-Host }
Set-Alias -Force -Option AllScope -Name cls -Value clear_screen
Set-Alias -Force -Option AllScope -Name clear -Value clear_screen

function git_add { git add $args }
Set-Alias -Force -Option AllScope -Name ga -Value git_add

function git_add_all { git add -A $args }
Set-Alias -Force -Option AllScope -Name gaa -Value git_add_all

function git_branch { git branch -v $args }
Set-Alias -Force -Option AllScope -Name gb -Value git_branch

function git_commit { git commit -m $args }
Set-Alias -Force -Option AllScope -Name gc -Value git_commit

function git_commit_amend { git commit --amend $args }
Set-Alias -Force -Option AllScope -Name gca -Value git_commit_amend

function git_checkout { git checkout $args }
Set-Alias -Force -Option AllScope -Name gco -Value git_checkout

function git_diff { git diff $args }
Set-Alias -Force -Option AllScope -Name gd -Value git_diff

function git_diff_staged { git diff --staged $args }
Set-Alias -Force -Option AllScope -Name gds -Value git_diff_staged

function git_log { git log --pretty=history $args }
Set-Alias -Force -Option AllScope -Name gl -Value git_log

function git_pull { git pull --rebase $args }
Set-Alias -Force -Option AllScope -Name gpu -Value git_pull

function git_push { git push $args }
Set-Alias -Force -Option AllScope -Name gp -Value git_push

function git_push_force { git push --force $args }
Set-Alias -Force -Option AllScope -Name gpf -Value git_push_force

function git_rebase { git rebase $args }
Set-Alias -Force -Option AllScope -Name grb -Value git_rebase

function git_remote { git remote -v $args }
Set-Alias -Force -Option AllScope -Name gr -Value git_remote

function git_show { git show $args }
Set-Alias -Force -Option AllScope -Name gsh -Value git_show

function git_status { git status $args }
Set-Alias -Force -Option AllScope -Name gs -Value git_status

function git_status_untracked { git status -u $args }
Set-Alias -Force -Option AllScope -Name gsu -Value git_status_untracked

function list { eza -l --color=always --git-ignore --group-directories-first --time-style=long-iso $args }
Set-Alias -Force -Option AllScope -Name ls -Value list

function list_all { eza -al --color=always --group-directories-first --time-style=long-iso $args }
Set-Alias -Force -Option AllScope -Name lsa -Value list_all

function list_tree { eza -lT --color=always --git-ignore --group-directories-first --time-style=long-iso $args }
Set-Alias -Force -Option AllScope -Name lst -Value list_tree

function list_tree_all { eza -alT --color=always --group-directories-first --time-style=long-iso $args }
Set-Alias -Force -Option AllScope -Name lsta -Value list_tree_all

function msys_shell { msys2_shell.cmd -defterm -here -no-start -msys2 -shell bash }
Set-Alias -Force -Option AllScope -Name msys -Value msys_shell

function path { Write-Output ($env:Path).Split(';') }
Set-Alias -Force -Option AllScope -Name p -Value path

function touch_file { New-Item -ItemType File -Path $args }
Set-Alias -Force -Option AllScope -Name touch -Value touch_file

Set-Alias -Force -Option AllScope -Name type -Value Get-Command

function virtual_env_enable { .\venv\Scripts\Activate.ps1 }
Set-Alias -Force -Option AllScope -Name va -Value virtual_env_enable

# Key bindings
#-------------------------------------------------------------------------------

Set-PSReadLineKeyHandler -Chord Ctrl+y -Function ClearScreen

# Prompt
#-------------------------------------------------------------------------------

# This prompt mod provides the current working directory to the shell, enabling
# the user to spawn new shells in the same directory.
# see: https://learn.microsoft.com/en-us/windows/terminal/tutorials/new-tab-same-directory#zsh
function Invoke-Starship-PreCommand {
    $loc = $executionContext.SessionState.Path.CurrentLocation;
    $prompt = "$([char]27)]9;12$([char]7)"
    if ($loc.Provider.Name -eq "FileSystem")
    {
        $prompt += "$([char]27)]9;9;`"$($loc.ProviderPath)`"$([char]27)\"
    }
    $host.ui.Write($prompt)
}

# Hooks
#-------------------------------------------------------------------------------

# NOTE: Doesn't work on powershell 5.
# Invoke-Expression "$(direnv hook pwsh)"

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
Invoke-Expression (& { (fnm env --use-on-cd | Out-String) })

# Startup
#-------------------------------------------------------------------------------

Set-Title
