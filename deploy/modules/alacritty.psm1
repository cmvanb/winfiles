#-------------------------------------------------------------------------------
# Deploy alacritty
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."
Import-Module "$base_dir.\utils\fs" -Force

function deploy {
    link_or_copy `
        -source "$base_dir\config\alacritty\alacritty.toml" `
        -destination "$env:APPDATA\alacritty\alacritty.toml"
}

function undeploy {
    force_delete "$env:APPDATA\alacritty\alacritty.toml"
}

Export-ModuleMember -Function *