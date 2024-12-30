#-------------------------------------------------------------------------------
# Deploy powershell
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\config\powershell\modules\utils\fs" -Force
Import-Module "$base_dir\config\powershell\modules\utils\system" -Force


function deploy {
    print "└> Installing powershell modules and profiles."

    # Powershell 5 -------------------------------------------------------------
    # Install modules.
    link_or_copy `
        -source "$base_dir\config\powershell\modules" `
        -destination "$env:USERPROFILE\Documents\WindowsPowerShell\Modules"

    # Install profile.
    link_or_copy `
        -source "$base_dir\config\powershell\Profile.ps1" `
        -destination "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

    # Powershell 7 -------------------------------------------------------------
    # Install modules.
    link_or_copy `
        -source "$base_dir\config\powershell\modules" `
        -destination "$env:USERPROFILE\Documents\PowerShell\Modules"

    # Install profile.
    link_or_copy `
        -source "$base_dir\config\powershell\Profile.ps1" `
        -destination "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
}

function undeploy {
    print "└> Uninstalling powershell modules and profiles."

    force_delete "$env:USERPROFILE\Documents\WindowsPowerShell\Modules"
    force_delete "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

    force_delete "$env:USERPROFILE\Documents\PowerShell\Modules"
    force_delete "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
}

Export-ModuleMember -Function *