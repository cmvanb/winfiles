#-------------------------------------------------------------------------------
# Filesystem utilities
#-------------------------------------------------------------------------------

function make_link($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}

function ensure_directory($path) {
    if (-not (Test-Path $path)) {
        [void](New-Item -Path $path -ItemType Directory)
    }
}

function safe_copy($source, $destination) {
    ensure_directory (Split-Path -Path $destination)
    Copy-Item -Path $source -Destination $destination
}