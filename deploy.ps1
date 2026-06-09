#-------------------------------------------------------------------------------
# Deploy winfiles
#-------------------------------------------------------------------------------

[CmdletBinding()]
param(
    [Parameter(Position=0)]
    [string]$Command = '',

    [Parameter(Position=1, ValueFromRemainingArguments)]
    [string[]]$Remaining,

    [switch]$DryRun
)

$base_dir = $PSScriptRoot

$env:XDG_CONFIG_HOME  = "$env:USERPROFILE\.config"
$env:XDG_CACHE_HOME   = "$env:USERPROFILE\.local\cache"
$env:XDG_DATA_HOME    = "$env:USERPROFILE\.local\share"
$env:XDG_BIN_HOME     = "$env:USERPROFILE\.local\bin"
$env:XDG_OPT_HOME     = "$env:USERPROFILE\.local\opt"
$env:XDG_SCRIPTS_HOME = "$env:USERPROFILE\.local\scripts"
$env:DEPLOY_HOST      = $env:COMPUTERNAME
$env:DEPLOY_DISTRO    = 'windows'

$state_dir = "$env:USERPROFILE\.local\state\dotfiles"

Import-Module "$base_dir\lib\profile.psm1" -Force


function _run_module([string]$name, [string]$action) {
    $module_path = "$base_dir\modules\$name\deploy.psm1"
    if (-not (Test-Path $module_path)) {
        Write-Error "Module '$name' not found."
        return
    }
    $mod = Import-Module $module_path -Force -PassThru
    & $action
    Remove-Module -ModuleInfo $mod -Force
}

function _install_profile([string]$profile_name) {
    $chain = profile_resolve_chain $profile_name
    $env:DEPLOY_PROFILE = $chain -join ' '
    $merged = profile_merge $chain

    Write-Host "Installing profile '$profile_name'..."

    foreach ($name in @($merged.lib)) {
        if ($DryRun) { Write-Host "  [dry-run] $name"; continue }
        _run_module $name 'install'
    }
    foreach ($name in @($merged.theme)) {
        if ($DryRun) { Write-Host "  [dry-run] $name"; continue }
        _run_module $name 'install'
    }
    foreach ($name in @($merged.install)) {
        if ($DryRun) { Write-Host "  [dry-run] $name"; continue }
        _run_module $name 'install'
    }

    if (-not $DryRun) {
        New-Item -Force -ItemType Directory $state_dir | Out-Null
        Set-Content "$state_dir\profile" $profile_name
        $all = $merged.lib + $merged.theme + $merged.install
        Set-Content "$state_dir\modules" ($all -join ' ')
    }
}

function _load_state() {
    if (-not (Test-Path "$state_dir\profile")) { return $null }
    return @{
        profile = (Get-Content "$state_dir\profile")
        modules = ((Get-Content "$state_dir\modules") -split '\s+' | Where-Object { $_ -ne '' })
    }
}


switch ($Command) {
    'install' {
        if (-not $Remaining -or $Remaining[0] -eq '--host') {
            _install_profile $env:COMPUTERNAME.ToLower()
        } elseif (Test-Path "$base_dir\profiles\$($Remaining[0])") {
            _install_profile $Remaining[0]
        } else {
            foreach ($name in $Remaining) {
                if ($DryRun) { Write-Host "  [dry-run] $name"; continue }
                _run_module $name 'install'
            }
        }
    }

    'uninstall' {
        $state = _load_state
        if (-not $state) {
            Write-Error "No active deployment state found."
            exit 1
        }
        Write-Host "Uninstalling profile '$($state.profile)'..."
        [array]::Reverse($state.modules)
        foreach ($name in $state.modules) {
            if ($DryRun) { Write-Host "  [dry-run] $name"; continue }
            _run_module $name 'uninstall'
        }
        if (-not $DryRun) {
            Remove-Item "$state_dir\profile" -Force -ErrorAction SilentlyContinue
            Remove-Item "$state_dir\modules" -Force -ErrorAction SilentlyContinue
        }
    }

    'list' {
        Write-Host 'Profiles:'
        Get-ChildItem "$base_dir\profiles" -File | ForEach-Object { Write-Host "  $($_.Name)" }
        Write-Host ''
        Write-Host 'Modules:'
        Get-ChildItem "$base_dir\modules" -Directory | ForEach-Object { Write-Host "  $($_.Name)" }
    }

    'status' {
        $state = _load_state
        if ($state) {
            Write-Host "Profile: $($state.profile)"
            Write-Host "Modules: $($state.modules -join ' ')"
        } else {
            Write-Host 'No active deployment.'
        }
    }

    'show' {
        $profile_name = $Remaining[0]
        $chain  = profile_resolve_chain $profile_name
        $merged = profile_merge $chain
        Write-Host "Profile: $profile_name"
        Write-Host "Lib:     $($merged.lib -join ' ')"
        Write-Host "Theme:   $($merged.theme -join ' ')"
        Write-Host "Install: $($merged.install -join ' ')"
    }

    default {
        Write-Host 'Usage: .\deploy.ps1 <command> [options]'
        Write-Host ''
        Write-Host 'Commands:'
        Write-Host '  install --host              install profile matching hostname'
        Write-Host '  install <profile>           install named profile'
        Write-Host '  install <module...>         install one or more modules directly'
        Write-Host '  uninstall                   uninstall using tracked state'
        Write-Host '  list                        list all profiles and modules'
        Write-Host '  show <profile>              show resolved module set'
        Write-Host '  status                      show active profile'
        Write-Host ''
        Write-Host 'Options:'
        Write-Host '  --dry-run                   print what would be installed'
    }
}
