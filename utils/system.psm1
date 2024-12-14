#-------------------------------------------------------------------------------
# System utilities
#-------------------------------------------------------------------------------

function print($message) {
    Write-Output $message
}

function is_admin() {
    [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")
}

function is_developer() {
    return (Get-WindowsDeveloperLicense -ErrorAction SilentlyContinue).IsValid
}

Export-ModuleMember -Function *