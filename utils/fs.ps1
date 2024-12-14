#-------------------------------------------------------------------------------
# Filesystem utilities
#-------------------------------------------------------------------------------

function exists($path) {
    return (Test-Path -Path $path)
}

function make_link($target, $link) {
    [void](New-Item -Path $link -ItemType SymbolicLink -Value $target)
}

function ensure_directory($path) {
    if (-not (exists $path)) {
        [void](New-Item -Path $path -ItemType Directory)
    }
}

function force_delete($path) {
    if (exists $path) {
        Remove-Item -Force -Recurse -Path $path
    }
}

function is_admin() {
    [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")
}

function force_copy($source, $destination) {
    if (exists $destination) {
        force_delete $destination
    }

    ensure_directory (Split-Path -Parent -Path $destination)

    if (Test-Path -Path $source -PathType Container) {
        Copy-Item -Force -Recurse -Path $source -Destination $destination
    } elseif (Test-Path -Path $source -PathType Leaf) {
        Copy-Item -Force -Path $source -Destination $destination
    }
}

function install($source, $destination) {
    if (exists $destination) {
        force_delete $destination
        Write-Output "remove: ``$destination``."
    }

    ensure_directory (Split-Path -Parent -Path $destination)

    if (is_admin) {
        make_link $source $destination
        Write-Output "link: ``$source`` -> ``$destination``"
    } else {
        force_copy $source $destination
        Write-Output "copy: ``$source`` -> ``$destination``"
    }
}