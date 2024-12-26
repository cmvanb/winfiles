#-------------------------------------------------------------------------------
# Filesystem utilities
#-------------------------------------------------------------------------------

function exists($path) {
    return (Test-Path -Path $path)
}

function is_directory($path) {
    return Test-Path -Path $path -PathType Container
}

function is_file($path) {
    return Test-Path -Path $path -PathType Leaf
}

# NOTE: If you are getting "The system cannot find the file specified.",
# you may be trying to make a link in a protected folder.
# see: `Ransomware protection`, `Controlled folder access`
function make_link_cmd($source, $destination) {
    if (exists $destination) {
        force_delete $destination
    }

    # NOTE: Paths need to be absolute.
    $source = Resolve-Path -Path $source

    if (is_directory $source) {
        $result = cmd /c mklink /D $destination $source

    } elseif (is_file $source) {
        $result = cmd /c mklink $destination $source
    }

    if ($result -match "symbolic link created") {
        print "link: ``$source`` -> ``$destination``"

    } elseif ($result -eq "The system cannot find the file specified.") {
        throw "Failed to create link (access error): ``$source`` -> ``$destination``"

    } else {
        throw "Failed to create link (unknown error): ``$source`` -> ``$destination``"
    }
}

function make_link_ps($source, $destination) {
    if (exists $destination) {
        force_delete $destination
    }

    New-Item `
        -ItemType SymbolicLink `
        -Path $destination `
        -Target $source `
        -ErrorVariable linkFailed

    if (-not ($linkFailed)) {
        print "link: ``$source`` -> ``$destination``"
    }
}

function make_link_ps_elevated($source, $destination) {
    if (exists $destination) {
        force_delete $destination
    }

    gsudo New-Item `
        -ItemType SymbolicLink `
        -Path $destination `
        -Target $source `
        -ErrorVariable linkFailed

    if (-not ($linkFailed)) {
        print "link: ``$source`` -> ``$destination``"
    }
}

function delete_link($path) {
    if (-not (exists $path)) {
        return
    }

    (Get-Item $path).Delete()

    print "delete link: ``$path``"
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

    if (is_directory $source) {
        Copy-Item `
            -Force `
            -Recurse `
            -Path $source `
            -Destination $destination `
            -ErrorVariable copyFailed

    } elseif (is_file $source) {
        Copy-Item `
            -Force `
            -Path $source `
            -Destination $destination `
            -ErrorVariable copyFailed
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

    try {
        if (is_admin) {
            make_link_ps $source $destination

        } elseif (is_developer) {
            make_link_cmd $source $destination

        } else {
            make_link_ps_elevated $source $destination
        }
    }
    catch {
        force_copy $source $destination
    }
}

Export-ModuleMember -Function *