#-------------------------------------------------------------------------------
# Deploy windows terminal
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force


function deploy {
    print "└> Installing windows terminal configuration."

    link_or_copy `
        -source "$base_dir\config\windows-terminal\settings.json" `
        -destination "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
}

function undeploy {
    print "└> Uninstalling windows terminal configuration."

    force_delete "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
}