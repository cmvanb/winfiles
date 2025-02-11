#-------------------------------------------------------------------------------
# Deploy keymapper
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force


function deploy {
    print "└> Installing keymapper configuration."

    link_or_copy `
        -source "$base_dir\config\keymapper\keymapper.conf" `
        -destination "$env:XDG_CONFIG_HOME\keymapper.conf"
}

function undeploy {
    print "└> Uninstalling keymapper configuration."

    force_delete "$env:XDG_CONFIG_HOME\keymapper.conf"
}

Export-ModuleMember -Function *