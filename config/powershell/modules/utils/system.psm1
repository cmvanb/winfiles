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

function set_registry_key($key, $name, $value) {
    print " └> Set registry key: ``$key\$name`` -> ``$value``"

    Set-ItemProperty -Path $key -Name $name -Value $value
}

function unset_registry_key($key, $name) {
    print " └> Unset registry key: ``$key\$name``"

    Remove-ItemProperty -Path $key -Name $name
}

function set_env_var($name, $value) {
    Set-ItemProperty -Path HKCU:\Environment -Name $name -Value $value
}

Export-ModuleMember -Function *