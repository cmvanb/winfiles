#-------------------------------------------------------------------------------
# Deploy eza
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force
Import-Module "utils\template" -Force


function deploy {
    print "└> Installing eza configuration."

    render_mako_template `
        -template "$base_dir\config\eza\theme.yml.mako" `
        -target "$env:APPDATA\eza\theme.yml"
}

function undeploy {
    print "└> Uninstalling bat configuration."

    force_delete "$env:APPDATA\eza\theme.yml"
}

Export-ModuleMember -Function *