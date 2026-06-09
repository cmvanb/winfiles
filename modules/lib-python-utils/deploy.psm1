#-------------------------------------------------------------------------------
# Deploy lib-python-utils
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\system.psm1" -Force


function install {
    Write-Host "└> Installing lib-python-utils."

    python -m pip install --break-system-packages "$base_dir\modules\lib-python-utils\src"
}

function uninstall {
    Write-Host "└> Uninstalling lib-python-utils."

    python -m pip uninstall --yes template
}

Export-ModuleMember -Function install, uninstall
