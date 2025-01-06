#-------------------------------------------------------------------------------
# Deploy starship
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force


function deploy {
    print "└> Installing starship configuration."

    link_or_copy `
        -source "$base_dir\config\starship\starship.toml" `
        -destination "$env:XDG_CONFIG_HOME\starship\starship.toml"
}

function undeploy {
    print "└> Uninstalling starship configuration."

    force_delete "$env:XDG_CONFIG_HOME\starship\starship.toml"
}

Export-ModuleMember -Function *