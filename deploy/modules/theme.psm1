#-------------------------------------------------------------------------------
# Deploy theme config
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force


function deploy {
    print "└> Installing theme configuration."

    link_or_copy -source "$base_dir\config\theme\carbon-dark.yaml"  -destination "$env:XDG_CONFIG_HOME\theme\colors.yaml"
    link_or_copy -source "$base_dir\config\theme\fonts-windows.yaml" -destination "$env:XDG_CONFIG_HOME\theme\fonts.yaml"
    link_or_copy -source "$base_dir\config\theme\cursor.yaml"        -destination "$env:XDG_CONFIG_HOME\theme\cursor.yaml"

    python "$base_dir\config\python\theme\theme.py" parse `
        "$env:XDG_CONFIG_HOME\theme\colors.yaml" `
        "$env:XDG_CONFIG_HOME\theme\fonts.yaml" `
        "$env:XDG_CONFIG_HOME\theme\cursor.yaml"
}

function undeploy {
    print "└> Uninstalling theme configuration."

    force_delete "$env:XDG_CONFIG_HOME\theme\colors.yaml"
    force_delete "$env:XDG_CONFIG_HOME\theme\fonts.yaml"
    force_delete "$env:XDG_CONFIG_HOME\theme\cursor.yaml"
    force_delete "$env:XDG_CACHE_HOME\theme\theme-data.lua"
    force_delete "$env:XDG_CACHE_HOME\theme\theme-data.sh"
}
