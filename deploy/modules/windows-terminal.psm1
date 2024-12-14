#-------------------------------------------------------------------------------
# Deploy windows terminal
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "$base_dir.\utils\fs"

function deploy {
    link_or_copy `
        -source "$base_dir\config\windows-terminal\settings.json" `
        -destination "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
}

function undeploy {
    force_delete "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
}