# Environment variables
[System.Environment]::SetEnvironmentVariable('PYTHONPYCACHEPREFIX', $env:USERPROFILE + '\.cache\python', 'User')

# Aliases
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

function git_push { git push }
Set-Alias -Force -Option AllScope -Name gp -Value git_push

function git_push_force { git push --force }
Set-Alias -Force -Option AllScope -Name gpf -Value git_push_force

function git_remote { git remote -v }
Set-Alias -Force -Option AllScope -Name gr -Value git_remote

function git_status { git status }
Set-Alias -Force -Option AllScope -Name gs -Value git_status

function git_status_untracked { git status -u }
Set-Alias -Force -Option AllScope -Name gsu -Value git_status_untracked

Set-Alias -Force -Option AllScope -Name type -Value Get-Command