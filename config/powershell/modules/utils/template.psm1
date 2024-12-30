#-------------------------------------------------------------------------------
# Template utilities
#-------------------------------------------------------------------------------

Import-Module "utils\fs" -Force


function render_mako_template($template, $target) {
    ensure_directory (Split-Path -Path $target -Parent)

    $result = python -m template "$template" "$target"
    if ($LASTEXITCODE -eq 0) {
        Write-Output "render template ``$template`` to ``$target``..."
        $result
    }
}

Export-ModuleMember -Function *