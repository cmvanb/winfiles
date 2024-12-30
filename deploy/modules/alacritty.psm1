#-------------------------------------------------------------------------------
# Deploy alacritty
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force


function deploy {
    print "└> Installing alacritty configuration."

    link_or_copy `
        -source "$base_dir\config\alacritty\alacritty.toml" `
        -destination "$env:APPDATA\alacritty\alacritty.toml"
}

function undeploy {
    print "└> Uninstalling alacritty configuration."

    force_delete "$env:APPDATA\alacritty\alacritty.toml"
}

Export-ModuleMember -Function *