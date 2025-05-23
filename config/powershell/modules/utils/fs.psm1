#-------------------------------------------------------------------------------
# Filesystem utilities
#-------------------------------------------------------------------------------

Import-Module "utils\system" -Force


function exists([string]$path) {
    return (Test-Path -Path $path)
}

function is_directory([string]$path) {
    return Test-Path -Path $path -PathType Container
}

function is_file([string]$path) {
    return Test-Path -Path $path -PathType Leaf
}

function is_link([string]$path) {
    $file = Get-Item $path -Force -ea SilentlyContinue
    return [bool]($file.Attributes -band [IO.FileAttributes]::ReparsePoint)
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
        print " └> Link: ``$source`` -> ``$destination``"

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
        print " └> Link: ``$source`` -> ``$destination``"
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
        print " └> Link: ``$source`` -> ``$destination``"
    }
}

function delete_link($path) {
    if (-not (exists $path)) {
        return
    }

    if (-not (is_link $path)) {
        return
    }

    (Get-Item $path).Delete()

    print " └> Delete link: ``$path``"
}

function make_shortcut($path, $target) {
    if (exists $path) {
        force_delete $path
    }

    $ws_shell = New-Object -ComObject WScript.Shell
    $shortcut = $ws_shell.CreateShortcut("$path")
    $shortcut.TargetPath = "$target"
    $shortcut.Save()
}

function ensure_directory($path) {
    if (-not (exists $path)) {
        [void](New-Item -Path $path -ItemType Directory)
    }
}

function force_delete($path) {
    if (-not (exists $path)) {
        return
    }

    if (is_link $path) {
        delete_link $path
        return
    }

    Remove-Item -Force -Recurse -Path $path -ErrorVariable removeFailed

    if (-not ($removeFailed)) {
        print " └> Delete: ``$path``"
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
        print " └> Copy: ``$source`` -> ``$destination``"
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