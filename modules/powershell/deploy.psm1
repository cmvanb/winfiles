#-------------------------------------------------------------------------------
# Deploy powershell
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force


function install {
    Write-Host "└> Installing powershell modules and profiles."

    $src = "$base_dir\modules\powershell\src"

    # Powershell 5
    link_or_copy `
        -source "$src\modules" `
        -destination "$env:USERPROFILE\Documents\WindowsPowerShell\Modules"
    link_or_copy `
        -source "$src\Profile.ps1" `
        -destination "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    link_or_copy `
        -source "$src\Aliases.ps1" `
        -destination "$env:USERPROFILE\Documents\WindowsPowerShell\Aliases.ps1"

    # Powershell 7
    link_or_copy `
        -source "$src\modules" `
        -destination "$env:USERPROFILE\Documents\PowerShell\Modules"
    link_or_copy `
        -source "$src\Profile.ps1" `
        -destination "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    link_or_copy `
        -source "$src\Aliases.ps1" `
        -destination "$env:USERPROFILE\Documents\PowerShell\Aliases.ps1"
}

function uninstall {
    Write-Host "└> Uninstalling powershell modules and profiles."

    force_delete "$env:USERPROFILE\Documents\WindowsPowerShell\Modules"
    force_delete "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    force_delete "$env:USERPROFILE\Documents\PowerShell\Modules"
    force_delete "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
}

Export-ModuleMember -Function install, uninstall
