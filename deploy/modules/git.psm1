#-------------------------------------------------------------------------------
# Deploy git
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

function deploy {
    link_or_copy `
        -source "$base_dir\config\git\.gitconfig" `
        -destination "$env:USERPROFILE\.gitconfig"
}

function undeploy {
    force_delete "$env:USERPROFILE\.gitconfig"
}

Export-ModuleMember -Function *