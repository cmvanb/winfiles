#-------------------------------------------------------------------------------
# Deploy theme config
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force


function deploy {
    print "└> Installing theme configuration."

    link_or_copy `
        -source "$base_dir\config\theme\carbon-dark.yaml" `
        -destination "$env:XDG_CONFIG_HOME\theme\theme.yaml"
}

function undeploy {
    print "└> Uninstalling theme configuration."

    force_delete "$env:XDG_CONFIG_HOME\theme\theme.yaml"
}