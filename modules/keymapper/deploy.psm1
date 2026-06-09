#-------------------------------------------------------------------------------
# Deploy keymapper
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force


function install {
    Write-Host "└> Installing keymapper configuration."

    link_or_copy `
        -source "$base_dir\modules\keymapper\src\keymapper.conf" `
        -destination "$env:XDG_CONFIG_HOME\keymapper.conf"
}

function uninstall {
    Write-Host "└> Uninstalling keymapper configuration."

    force_delete "$env:XDG_CONFIG_HOME\keymapper.conf"
}

Export-ModuleMember -Function install, uninstall
