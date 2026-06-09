#-------------------------------------------------------------------------------
# Deploy git
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force


function install {
    Write-Host "└> Installing git configuration."

    link_or_copy `
        -source "$base_dir\modules\git\src\.gitconfig" `
        -destination "$env:USERPROFILE\.gitconfig"

    link_or_copy `
        -source "$base_dir\modules\git\src\ignore" `
        -destination "$env:USERPROFILE\.config\git\ignore"
}

function uninstall {
    Write-Host "└> Uninstalling git configuration."

    force_delete "$env:USERPROFILE\.gitconfig"
    force_delete "$env:USERPROFILE\.config\git\ignore"
}

Export-ModuleMember -Function install, uninstall
