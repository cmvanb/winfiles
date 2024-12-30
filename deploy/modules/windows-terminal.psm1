#-------------------------------------------------------------------------------
# Deploy windows terminal
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force
Import-Module "utils\template" -Force


function deploy {
    print "└> Installing windows terminal configuration."

    render_mako_template `
        -template "$base_dir\config\windows-terminal\settings.json.mako" `
        -target "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
}

function undeploy {
    print "└> Uninstalling windows terminal configuration."

    force_delete "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
}