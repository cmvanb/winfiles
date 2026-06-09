#-------------------------------------------------------------------------------
# Deploy alacritty
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force


function install {
    Write-Host "└> Installing alacritty configuration."

    link_or_copy `
        -source "$base_dir\modules\alacritty\src\alacritty.toml" `
        -destination "$env:APPDATA\alacritty\alacritty.toml"
}

function uninstall {
    Write-Host "└> Uninstalling alacritty configuration."

    force_delete "$env:APPDATA\alacritty\alacritty.toml"
}

Export-ModuleMember -Function install, uninstall
