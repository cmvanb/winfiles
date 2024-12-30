#-------------------------------------------------------------------------------
# Deploy vscode
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force
Import-Module "utils\template" -Force

# NOTE: The destination path is for a scoop installation, consider handling other locations.
$target_dir = "$env:USERPROFILE\scoop\apps\vscode\current\data"


function deploy {
    print "└> Installing vscode configuration."

    # Configuration files
    link_or_copy `
        -source "$base_dir\config\vscode\settings.json" `
        -destination "$target_dir\user-data\User\settings.json"
    link_or_copy `
        -source "$base_dir\config\vscode\keybindings.json" `
        -destination "$target_dir\user-data\User\keybindings.json"

    # Custom theme
    render_mako_template `
        -template "$base_dir\config\vscode\theme.json.mako" `
        -target "$base_dir\config\vscode\custom-theme\themes\theme.json"
    link_or_copy `
        -source "$base_dir\config\vscode\custom-theme" `
        -destination "$target_dir\extensions\custom-theme"
}

function undeploy {
    print "└> Uninstalling vscode configuration."

    force_delete "$target_dir\settings.json"
    force_delete "$target_dir\keybindings.json"
    force_delete "$target_dir\extensions\custom-theme"
}

Export-ModuleMember -Function *