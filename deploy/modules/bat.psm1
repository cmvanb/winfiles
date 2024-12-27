#-------------------------------------------------------------------------------
# Deploy bat
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

function deploy {
    link_or_copy `
        -source "$base_dir\config\bat\config" `
        -destination "$env:APPDATA\bat\config"
}

function undeploy {
    force_delete "$env:APPDATA\bat\config"
}

Export-ModuleMember -Function *