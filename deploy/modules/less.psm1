#-------------------------------------------------------------------------------
# Deploy less
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force


function deploy {
    print "└> Installing less configuration."

    link_or_copy `
        -source "$base_dir\config\less\lesskey" `
        -destination "$env:USERPROFILE\.config\lesskey"
}

function undeploy {
    print "└> Uninstalling less configuration."

    force_delete "$env:USERPROFILE\.config\lesskey"
}

Export-ModuleMember -Function *