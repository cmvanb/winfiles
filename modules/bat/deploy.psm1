#-------------------------------------------------------------------------------
# Deploy bat
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force


function install {
    Write-Host "└> Installing bat configuration."

    link_or_copy `
        -source "$base_dir\modules\bat\src\config" `
        -destination "$env:APPDATA\bat\config"

    bat cache --build
}

function uninstall {
    Write-Host "└> Uninstalling bat configuration."

    force_delete "$env:APPDATA\bat\config"
}

Export-ModuleMember -Function install, uninstall
