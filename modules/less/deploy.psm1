#-------------------------------------------------------------------------------
# Deploy less
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force


function install {
    Write-Host "└> Installing less configuration."

    link_or_copy `
        -source "$base_dir\modules\less\src\lesskey" `
        -destination "$env:XDG_CONFIG_HOME\lesskey"
}

function uninstall {
    Write-Host "└> Uninstalling less configuration."

    force_delete "$env:XDG_CONFIG_HOME\lesskey"
}

Export-ModuleMember -Function install, uninstall
