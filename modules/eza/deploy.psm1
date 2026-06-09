#-------------------------------------------------------------------------------
# Deploy eza
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force
Import-Module "$base_dir\lib\template.psm1" -Force


function install {
    Write-Host "└> Installing eza configuration."

    render_mako_template `
        -template "$base_dir\modules\eza\src\theme.yml.mako" `
        -target "$env:APPDATA\eza\theme.yml"
}

function uninstall {
    Write-Host "└> Uninstalling eza configuration."

    force_delete "$env:APPDATA\eza\theme.yml"
}

Export-ModuleMember -Function install, uninstall
