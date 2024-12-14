#-------------------------------------------------------------------------------
# Deploy vscode
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."
Import-Module "$base_dir.\utils\fs" -Force

# NOTE: The destination path is for a scoop installation, consider handling other locations.
$target_dir = "$env:USERPROFILE\scoop\apps\vscode\current\data\user-data\User"

function deploy {
    link_or_copy `
        -source "$base_dir\config\vscode\settings.json" `
        -destination "$target_dir\settings.json"
    link_or_copy `
        -source "$base_dir\config\vscode\keybindings.json" `
        -destination "$target_dir\keybindings.json"
}

function undeploy {
    force_delete "$target_dir\settings.json"
    force_delete "$target_dir\keybindings.json"
}

Export-ModuleMember -Function *