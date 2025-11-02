#-------------------------------------------------------------------------------
# Deploy python libraries
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils/system" -Force


function deploy {
    print "└> Installing python modules."

    python -m pip install --break-system-packages "$base_dir\config\python\color"
    python -m pip install --break-system-packages "$base_dir\config\python\template"
    python -m pip install --break-system-packages "$base_dir\config\python\theme"
}

function undeploy {
    print "└> Uninstalling python modules."

    python -m pip uninstall "$base_dir\config\python\color"
    python -m pip uninstall "$base_dir\config\python\template"
    python -m pip uninstall "$base_dir\config\python\theme"
}
