#-------------------------------------------------------------------------------
# Deploy starship
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force


function install {
    Write-Host "└> Installing starship configuration."

    link_or_copy `
        -source "$base_dir\modules\starship\src\starship.toml" `
        -destination "$env:XDG_CONFIG_HOME\starship\starship.toml"
}

function uninstall {
    Write-Host "└> Uninstalling starship configuration."

    force_delete "$env:XDG_CONFIG_HOME\starship\starship.toml"
}

Export-ModuleMember -Function install, uninstall
