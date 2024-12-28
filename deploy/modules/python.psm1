#-------------------------------------------------------------------------------
# Deploy python libraries
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

function deploy {
    python -m pip install --upgrade pip
    python -m pip install "$base_dir\config\python\color"
    python -m pip install "$base_dir\config\python\theme"
}

function undeploy {
    python -m pip uninstall "$base_dir\config\python\color"
    python -m pip uninstall "$base_dir\config\python\theme"
}