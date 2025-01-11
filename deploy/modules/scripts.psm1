#-------------------------------------------------------------------------------
# Deploy scripts
#-------------------------------------------------------------------------------

$base_dir = Resolve-Path -Path "$PSScriptRoot\..\.."

Import-Module "utils\fs" -Force
Import-Module "utils\system" -Force


function deploy {
    print "└> Installing scripts."

    link_or_copy `
        "$base_dir\config\scripts\print-environment.py" `
        "$env:USERPROFILE\.local\scripts\print-environment.py"

    link_or_copy `
        "$base_dir\config\scripts\prevent-screen-lock.ahk" `
        "$env:USERPROFILE\.local\scripts\prevent-screen-lock.ahk"
    set_registry_key `
        -key "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
        -name "PreventScreenLock" `
        -value "$env:USERPROFILE\.local\scripts\prevent-screen-lock.ahk"
}

function undeploy {
    print "└> Uninstalling scripts."

    force_delete "$env:USERPROFILE\.local\scripts\print-environment.py"
    force_delete "$env:USERPROFILE\.local\scripts\prevent-screen-lock.ahk"
    unset_registry_key `
        -key "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
        -name "PreventScreenLock"
}

Export-ModuleMember -Function *