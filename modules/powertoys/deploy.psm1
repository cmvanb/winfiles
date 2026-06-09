#-------------------------------------------------------------------------------
# Deploy powertoys
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force


function install {
    Write-Host "└> Installing powertoys configuration."

    link_or_copy `
        -source "$base_dir\modules\powertoys\src\keymaps.json" `
        -destination "$env:LOCALAPPDATA\Microsoft\PowerToys\Keyboard Manager\default.json"
}

function uninstall {
    Write-Host "└> Uninstalling powertoys configuration."

    force_delete "$env:LOCALAPPDATA\Microsoft\PowerToys\Keyboard Manager\default.json"
}

Export-ModuleMember -Function install, uninstall
