#-------------------------------------------------------------------------------
# Deploy powertoys
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force


function deploy {
    print "└> Installing powertoys configuration."

    link_or_copy `
        -source "$base_dir\config\powertoys\keymaps.json" `
        -destination "$env:LOCALAPPDATA\Microsoft\PowerToys\Keyboard Manager\default.json"
}

function undeploy {
    print "└> Uninstalling powertoys configuration."

    force_delete "$env:LOCALAPPDATA\Microsoft\PowerToys\Keyboard Manager\default.json"
}