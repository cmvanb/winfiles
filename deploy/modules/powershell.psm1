#-------------------------------------------------------------------------------
# Deploy powershell
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "$base_dir.\utils\fs"

function deploy {
    link_or_copy `
        -source "$base_dir\config\powershell\Profile.ps1" `
        -destination "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
}

function undeploy {
    force_delete "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
}

Export-ModuleMember -Function *