#-------------------------------------------------------------------------------
# Deploy vscode
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force
Import-Module "$base_dir\lib\template.psm1" -Force

$target_dir = "$env:USERPROFILE\scoop\apps\vscode\current\data"


function install {
    Write-Host "└> Installing vscode configuration."

    $src = "$base_dir\modules\vscode\src"

    link_or_copy `
        -source "$src\settings.json" `
        -destination "$target_dir\user-data\User\settings.json"
    link_or_copy `
        -source "$src\keybindings.json" `
        -destination "$target_dir\user-data\User\keybindings.json"

    render_mako_template `
        -template "$src\theme.json.mako" `
        -target "$src\custom-theme\themes\theme.json"
    link_or_copy `
        -source "$src\custom-theme" `
        -destination "$target_dir\extensions\custom-theme"
}

function uninstall {
    Write-Host "└> Uninstalling vscode configuration."

    force_delete "$target_dir\user-data\User\settings.json"
    force_delete "$target_dir\user-data\User\keybindings.json"
    force_delete "$target_dir\extensions\custom-theme"
}

Export-ModuleMember -Function install, uninstall
