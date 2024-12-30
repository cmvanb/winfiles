#-------------------------------------------------------------------------------
# Deploy bat
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force
Import-Module "utils\template" -Force


function deploy {
    print "└> Installing bat configuration."

    link_or_copy `
        -source "$base_dir\config\bat\config" `
        -destination "$env:APPDATA\bat\config"

    render_mako_template `
        -template "$base_dir\config\theme\carbon-dark.tmTheme.mako" `
        -target "$env:APPDATA\bat\themes\carbon-dark.tmTheme"

    bat cache --build
}

function undeploy {
    print "└> Uninstalling bat configuration."

    force_delete "$env:APPDATA\bat\config"
}

Export-ModuleMember -Function *