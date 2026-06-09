#-------------------------------------------------------------------------------
# Deploy scripts
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force


function install {
    Write-Host "└> Installing scripts."

    $src = "$base_dir\modules\scripts\src"

    link_or_copy "$src\print-environment.py"    "$env:XDG_SCRIPTS_HOME\print-environment.py"
    link_or_copy "$src\prevent-screen-lock.ahk" "$env:XDG_SCRIPTS_HOME\prevent-screen-lock.ahk"
    link_or_copy "$src\hide-idle-cursor.ahk"    "$env:XDG_SCRIPTS_HOME\hide-idle-cursor.ahk"

    set_registry_key `
        -key "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
        -name "PreventScreenLock" `
        -value "$env:XDG_SCRIPTS_HOME\prevent-screen-lock.ahk"
}

function uninstall {
    Write-Host "└> Uninstalling scripts."

    force_delete "$env:XDG_SCRIPTS_HOME\print-environment.py"
    force_delete "$env:XDG_SCRIPTS_HOME\prevent-screen-lock.ahk"
    force_delete "$env:XDG_SCRIPTS_HOME\hide-idle-cursor.ahk"

    unset_registry_key `
        -key "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
        -name "PreventScreenLock"
}

Export-ModuleMember -Function install, uninstall
