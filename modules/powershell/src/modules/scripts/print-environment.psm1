#-------------------------------------------------------------------------------
# Print environment function
#-------------------------------------------------------------------------------

function printenv() {
    python "$env:XDG_SCRIPTS_HOME\print-environment.py"
}

Export-ModuleMember -Function *