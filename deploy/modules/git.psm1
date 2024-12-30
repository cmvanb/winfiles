#-------------------------------------------------------------------------------
# Deploy git
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force


function deploy {
    print "└> Installing git configuration."

    link_or_copy `
        -source "$base_dir\config\git\.gitconfig" `
        -destination "$env:USERPROFILE\.gitconfig"
}

function undeploy {
    print "└> Uninstalling git configuration."

    force_delete "$env:USERPROFILE\.gitconfig"
}

Export-ModuleMember -Function *