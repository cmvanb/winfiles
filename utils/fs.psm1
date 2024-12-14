#-------------------------------------------------------------------------------
# Filesystem utilities
#-------------------------------------------------------------------------------

function exists($path) {
    return (Test-Path -Path $path)
}

function make_link($target, $link) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target -ErrorVariable linkFailed

    if (-not ($linkFailed)) {
        print "link: ``$source`` -> ``$destination``"
    }
}

function ensure_directory($path) {
    if (-not (exists $path)) {
        [void](New-Item -Path $path -ItemType Directory)
    }
}

function force_delete($path) {
    if (exists $path) {
        Remove-Item -Force -Recurse -Path $path -ErrorVariable removeFailed

        if (-not ($removeFailed)) {
            print "delete: ``$path``"
        }
    }
}

function force_copy($source, $destination) {
    if (exists $destination) {
        force_delete $destination
    }

    ensure_directory (Split-Path -Parent -Path $destination)

    if (Test-Path -Path $source -PathType Container) {
        Copy-Item -Force -Recurse -Path $source -Destination $destination -ErrorVariable copyFailed
    } elseif (Test-Path -Path $source -PathType Leaf) {
        Copy-Item -Force -Path $source -Destination $destination -ErrorVariable copyFailed
    }

    if (-not ($copyFailed)) {
        print "copy: ``$source`` -> ``$destination``"
    }
}

function link_or_copy($source, $destination) {
    if (exists $destination) {
        force_delete $destination
    }

    ensure_directory (Split-Path -Parent -Path $destination)

    # if ((is_admin) -or (is_developer)) {
    #     make_link $source $destination
    # } else {
        force_copy $source $destination
    # }
}

Export-ModuleMember -Function *