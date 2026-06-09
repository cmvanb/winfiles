#-------------------------------------------------------------------------------
# Deploy nvim
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force


function install {
    Write-Host "└> Installing neovim configuration."

    & git -C $base_dir submodule update --recursive --remote

    link_or_copy `
        -source "$base_dir\modules\nvim\src" `
        -destination "$env:XDG_CONFIG_HOME\nvim"
}

function uninstall {
    Write-Host "└> Uninstalling neovim configuration."

    force_delete "$env:XDG_CONFIG_HOME\nvim"
}

Export-ModuleMember -Function install, uninstall
