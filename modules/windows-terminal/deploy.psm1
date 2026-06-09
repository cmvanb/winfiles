#-------------------------------------------------------------------------------
# Deploy windows-terminal
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force
Import-Module "$base_dir\lib\template.psm1" -Force


function install {
    Write-Host "└> Installing windows-terminal configuration."

    render_mako_template `
        -template "$base_dir\modules\windows-terminal\src\settings.json.mako" `
        -target "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
}

function uninstall {
    Write-Host "└> Uninstalling windows-terminal configuration."

    force_delete "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
}

Export-ModuleMember -Function install, uninstall
