#-------------------------------------------------------------------------------
# Deploy neovim
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force


function deploy {
    print "└> Installing neovim configuration."

    link_or_copy `
        -source "$base_dir\config\nvim\" `
        -destination "$env:USERPROFILE\.config\nvim\"
}

function undeploy {
    print "└> Uninstalling neovim configuration."

    force_delete "$env:USERPROFILE\.config\nvim\"
}