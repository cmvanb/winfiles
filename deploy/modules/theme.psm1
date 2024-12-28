#-------------------------------------------------------------------------------
# Deploy theme config
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

function deploy {
    link_or_copy `
        -source "$base_dir\config\theme\carbon-dark.yaml" `
        -destination "$env:XDG_CONFIG_HOME\theme\theme.yaml"
}

function undeploy {
    force_delete "$env:XDG_CONFIG_HOME\theme\theme.yaml"
}