#-------------------------------------------------------------------------------
# Deploy theme-base
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force
Import-Module "$base_dir\lib\template.psm1" -Force


function install {
    Write-Host "└> Installing theme-base configuration."

    $src = "$base_dir\modules\theme-base\src"

    ensure_directory "$env:XDG_CONFIG_HOME\theme"

    link_or_copy -source "$src\carbon-dark.yaml"   -destination "$env:XDG_CONFIG_HOME\theme\colors.yaml"
    link_or_copy -source "$src\fonts-windows.yaml"  -destination "$env:XDG_CONFIG_HOME\theme\fonts.yaml"
    link_or_copy -source "$src\cursor.yaml"         -destination "$env:XDG_CONFIG_HOME\theme\cursor.yaml"

    python "$env:XDG_OPT_HOME\theme\theme.py" parse `
        "$env:XDG_CONFIG_HOME\theme\colors.yaml" `
        "$env:XDG_CONFIG_HOME\theme\fonts.yaml" `
        "$env:XDG_CONFIG_HOME\theme\cursor.yaml"

    render_mako_template `
        -template "$src\carbon-dark.tmTheme.mako" `
        -target "$env:APPDATA\bat\themes\carbon-dark.tmTheme"
}

function uninstall {
    Write-Host "└> Uninstalling theme-base configuration."

    force_delete "$env:XDG_CONFIG_HOME\theme\colors.yaml"
    force_delete "$env:XDG_CONFIG_HOME\theme\fonts.yaml"
    force_delete "$env:XDG_CONFIG_HOME\theme\cursor.yaml"
    force_delete "$env:XDG_CACHE_HOME\theme\theme-data.lua"
    force_delete "$env:XDG_CACHE_HOME\theme\theme-data.sh"
    force_delete "$env:XDG_CACHE_HOME\theme\theme-data.fish"
    force_delete "$env:APPDATA\bat\themes\carbon-dark.tmTheme"
}

Export-ModuleMember -Function install, uninstall
