#-------------------------------------------------------------------------------
# PowerShell profile
# NOTE: Shared between powershell and pwsh.
#-------------------------------------------------------------------------------

# Bootstrapping
#-------------------------------------------------------------------------------

# Imports
Import-Module -Force "scripts\print-environment"

# Environment variables
Set-ItemProperty -Path HKCU:\Environment -Name 'XDG_BIN_HOME'     -Value "$env:USERPROFILE\.local\bin"
Set-ItemProperty -Path HKCU:\Environment -Name 'XDG_CACHE_HOME'   -Value "$env:USERPROFILE\.local\cache"
Set-ItemProperty -Path HKCU:\Environment -Name 'XDG_CONFIG_HOME'  -Value "$env:USERPROFILE\.config"
Set-ItemProperty -Path HKCU:\Environment -Name 'XDG_DATA_HOME'    -Value "$env:USERPROFILE\.local\share"
Set-ItemProperty -Path HKCU:\Environment -Name 'XDG_SCRIPTS_HOME' -Value "$env:USERPROFILE\.local\scripts"
Set-ItemProperty -Path HKCU:\Environment -Name 'PYTHONPYCACHEPREFIX' -Value "$env:USERPROFILE\.local\cache\python"
Set-ItemProperty -Path HKCU:\Environment -Name 'STARSHIP_CONFIG'  -Value "$env:USERPROFILE\.config\starship\starship.toml"
Set-ItemProperty -Path HKCU:\Environment -Name 'SSH_AUTH_SOCK'    -Value "\\.\pipe\openssh-ssh-agent"
Set-ItemProperty -Path HKCU:\Environment -Name 'PATH'             -Value "$env:USERPROFILE\.local\bin;$env:PATH"

# XDG directories
if (-not (Test-Path $env:XDG_CACHE_HOME))   { [void](New-Item -Path $env:XDG_CACHE_HOME   -ItemType Directory) }
if (-not (Test-Path $env:XDG_CONFIG_HOME))  { [void](New-Item -Path $env:XDG_CONFIG_HOME  -ItemType Directory) }
if (-not (Test-Path $env:XDG_DATA_HOME))    { [void](New-Item -Path $env:XDG_DATA_HOME    -ItemType Directory) }
if (-not (Test-Path $env:XDG_SCRIPTS_HOME)) { [void](New-Item -Path $env:XDG_SCRIPTS_HOME -ItemType Directory) }

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

. "$PSScriptRoot\Aliases.ps1"

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
