#-------------------------------------------------------------------------------
# PowerShell aliases
#-------------------------------------------------------------------------------

# Git
#-------------------------------------------------------------------------------

Set-Alias -Force -Option AllScope -Name g -Value git

function git_add                { git add $args }
function git_add_all            { git add -A $args }
function git_add_interactive    { git add -i $args }
function git_branch             { git branch -v $args }
function git_cherry_pick        { git cherry-pick $args }
function git_clone              { git clone $args }
function git_commit             { git commit -m $args }
function git_commit_amend       { git commit --amend $args }
function git_checkout           { git checkout $args }
function git_diff               { git diff $args }
function git_diff_side          { git -c delta.side-by-side=true diff $args }
function git_diff_side_staged   { git -c delta.side-by-side=true diff --staged $args }
function git_diff_staged        { git diff --staged $args }
function git_log                { git log --pretty=history $args }
function git_push               { git push $args }
function git_push_all           { git push --all $args }
function git_push_force         { git push --force $args }
function git_pull               { git pull --rebase $args }
function git_rebase             { git rebase $args }
function git_rebase_abort       { git rebase --abort }
function git_rebase_continue    { git rebase --continue }
function git_rebase_interactive { git rebase -i $args }
function git_remote             { git remote -v $args }
function git_rm_cached          { git rm --cached $args }
function git_reset_head         { git reset HEAD $args }
function git_restore            { git restore $args }
function git_restore_staged     { git restore --staged $args }
function git_show               { git show $args }
function git_status             { git status $args }
function git_status_untracked   { git status -u $args }
function git_switch             { git switch $args }
function git_switch_create      { git switch -c $args }
function git_wip                { git add -A; git commit -m '[WIP]' }

Set-Alias -Force -Option AllScope -Name ga   -Value git_add
Set-Alias -Force -Option AllScope -Name gaa  -Value git_add_all
Set-Alias -Force -Option AllScope -Name gai  -Value git_add_interactive
Set-Alias -Force -Option AllScope -Name gb   -Value git_branch
Set-Alias -Force -Option AllScope -Name gcp  -Value git_cherry_pick
Set-Alias -Force -Option AllScope -Name gcl  -Value git_clone
Set-Alias -Force -Option AllScope -Name gc   -Value git_commit
Set-Alias -Force -Option AllScope -Name gca  -Value git_commit_amend
Set-Alias -Force -Option AllScope -Name gco  -Value git_checkout
Set-Alias -Force -Option AllScope -Name gd   -Value git_diff
Set-Alias -Force -Option AllScope -Name gdd  -Value git_diff_side
Set-Alias -Force -Option AllScope -Name gdds -Value git_diff_side_staged
Set-Alias -Force -Option AllScope -Name gds  -Value git_diff_staged
Set-Alias -Force -Option AllScope -Name gl   -Value git_log
Set-Alias -Force -Option AllScope -Name gp   -Value git_push
Set-Alias -Force -Option AllScope -Name gpa  -Value git_push_all
Set-Alias -Force -Option AllScope -Name gpf  -Value git_push_force
Set-Alias -Force -Option AllScope -Name gpu  -Value git_pull
Set-Alias -Force -Option AllScope -Name grb  -Value git_rebase
Set-Alias -Force -Option AllScope -Name grba -Value git_rebase_abort
Set-Alias -Force -Option AllScope -Name grbc -Value git_rebase_continue
Set-Alias -Force -Option AllScope -Name grbi -Value git_rebase_interactive
Set-Alias -Force -Option AllScope -Name gr   -Value git_remote
Set-Alias -Force -Option AllScope -Name grc  -Value git_rm_cached
Set-Alias -Force -Option AllScope -Name grs  -Value git_reset_head
Set-Alias -Force -Option AllScope -Name grt  -Value git_restore
Set-Alias -Force -Option AllScope -Name grts -Value git_restore_staged
Set-Alias -Force -Option AllScope -Name gsh  -Value git_show
Set-Alias -Force -Option AllScope -Name gs   -Value git_status
Set-Alias -Force -Option AllScope -Name gsu  -Value git_status_untracked
Set-Alias -Force -Option AllScope -Name gss  -Value git_switch
Set-Alias -Force -Option AllScope -Name gsc  -Value git_switch_create
Set-Alias -Force -Option AllScope -Name wip  -Value git_wip

# Navigation
#-------------------------------------------------------------------------------

function cd_set_title { Set-Location -Path "$args"; Set-Title }
Set-Alias -Force -Option AllScope -Name cd -Value cd_set_title

# Listing
#-------------------------------------------------------------------------------

function list          { eza -l  --color=always --group-directories-first --time-style=long-iso $args }
function list_all      { eza -al --color=always --group-directories-first --time-style=long-iso $args }
function list_ignored  { eza -l  --color=always --git-ignore --group-directories-first --time-style=long-iso $args }
function list_tree     { eza -lT --color=always --git-ignore --group-directories-first --time-style=long-iso $args }
function list_tree_all { eza -alT --color=always --git-ignore --group-directories-first --time-style=long-iso $args }

Set-Alias -Force -Option AllScope -Name ls   -Value list
Set-Alias -Force -Option AllScope -Name lsa  -Value list_all
Set-Alias -Force -Option AllScope -Name lsd  -Value list_all
Set-Alias -Force -Option AllScope -Name lsi  -Value list_ignored
Set-Alias -Force -Option AllScope -Name lst  -Value list_tree
Set-Alias -Force -Option AllScope -Name lsat -Value list_tree_all
Set-Alias -Force -Option AllScope -Name lsta -Value list_tree_all
Set-Alias -Force -Option AllScope -Name ez   -Value list

# Utilities
#-------------------------------------------------------------------------------

function clear_screen { Clear-Host }
Set-Alias -Force -Option AllScope -Name cls   -Value clear_screen
Set-Alias -Force -Option AllScope -Name clear -Value clear_screen

function msys_shell { msys2_shell.cmd -defterm -here -no-start -msys2 -shell bash }
Set-Alias -Force -Option AllScope -Name msys -Value msys_shell

function path { Write-Output ($env:Path).Split(';') }
Set-Alias -Force -Option AllScope -Name p -Value path

function rg_all { rg --hidden --no-ignore $args }
Set-Alias -Force -Option AllScope -Name rga -Value rg_all

function touch_file { New-Item -ItemType File -Path $args }
Set-Alias -Force -Option AllScope -Name touch -Value touch_file

function z_back { z - }
Set-Alias -Force -Option AllScope -Name zz -Value z_back

Set-Alias -Force -Option AllScope -Name cl   -Value claude
Set-Alias -Force -Option AllScope -Name oc   -Value opencode
Set-Alias -Force -Option AllScope -Name type -Value Get-Command

# Python
#-------------------------------------------------------------------------------

function virtual_env_enable  { .\venv\Scripts\Activate.ps1 }
function virtual_env_disable { deactivate }
Set-Alias -Force -Option AllScope -Name va -Value virtual_env_enable
Set-Alias -Force -Option AllScope -Name vd -Value virtual_env_disable
