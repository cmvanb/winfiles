#-------------------------------------------------------------------------------
# Template utilities
#-------------------------------------------------------------------------------

Import-Module "$PSScriptRoot\fs.psm1" -Force


function render_mako_template($template, $target) {
    ensure_directory (Split-Path -Path $target -Parent)

    $result = python -m template "$template" "$target"
    if ($LASTEXITCODE -eq 0) {
        Write-Output " └> Render template ``$template`` -> ``$target``"
        $result
    }
}

Export-ModuleMember -Function *