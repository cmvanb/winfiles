#-------------------------------------------------------------------------------
# Deploy scripts
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force


function deploy {
    print "└> Installing scripts."

    link_or_copy `
        "$base_dir\scripts\print-environment.py" `
        "$env:USERPROFILE\.local\scripts\print-environment.py"
}

function undeploy {
    print "└> Uninstalling scripts."

    force_delete "$env:USERPROFILE\.local\scripts\print-environment.py"
}

Export-ModuleMember -Function *