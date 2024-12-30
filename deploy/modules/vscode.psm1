#-------------------------------------------------------------------------------
# Deploy vscode
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force

# NOTE: The destination path is for a scoop installation, consider handling other locations.
$target_dir = "$env:USERPROFILE\scoop\apps\vscode\current\data\user-data\User"


function deploy {
    print "└> Installing vscode configuration."

    link_or_copy `
        -source "$base_dir\config\vscode\settings.json" `
        -destination "$target_dir\settings.json"
    link_or_copy `
        -source "$base_dir\config\vscode\keybindings.json" `
        -destination "$target_dir\keybindings.json"
}

function undeploy {
    print "└> Uninstalling vscode configuration."

    force_delete "$target_dir\settings.json"
    force_delete "$target_dir\keybindings.json"
}

Export-ModuleMember -Function *