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

function force_copy($source, $destination) {
    # Remove pre-existing.
    if (Test-Path -Path $destination) {
        Remove-Item -Force -Recurse -Path $destination
        Write-Output "Removed pre-existing ``$destination``."
    }

    # Ensure parent directory exists.
    ensure_directory (Split-Path -Parent -Path $destination)

    if (Test-Path -Path $source -PathType Container) {
        Copy-Item -Force -Recurse -Path $source -Destination $destination
        Write-Output "Copied directory ``$source`` to ``$destination``."
    } elseif (Test-Path -Path $source -PathType Leaf) {
        Copy-Item -Force -Path $source -Destination $destination
        Write-Output "Copied file ``$source`` to ``$destination``."
    }
}