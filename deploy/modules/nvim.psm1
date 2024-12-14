#-------------------------------------------------------------------------------
# Deploy neovim
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "$base_dir.\utils\fs"

function deploy {
    link_or_copy `
        -source "$base_dir\config\nvim\" `
        -destination "$env:USERPROFILE\.config\nvim\"
}

function undeploy {
    force_delete "$env:USERPROFILE\.config\nvim\"
}