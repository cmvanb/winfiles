#-------------------------------------------------------------------------------
# Deploy lib-theme
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force


function install {
    Write-Host "└> Installing lib-theme."

    link_or_copy `
        -source "$base_dir\modules\lib-theme\src" `
        -destination "$env:XDG_OPT_HOME\theme"
}

function uninstall {
    Write-Host "└> Uninstalling lib-theme."

    force_delete "$env:XDG_OPT_HOME\theme"
}

Export-ModuleMember -Function install, uninstall
