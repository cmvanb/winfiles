#-------------------------------------------------------------------------------
# Profile system utilities
#-------------------------------------------------------------------------------

function profile_parse([string]$name) {
    $base_dir = Resolve-Path "$PSScriptRoot\.."
    $path = "$base_dir\profiles\$name"
    if (-not (Test-Path $path)) {
        throw "Profile '$name' not found at '$path'."
    }
    $result = @{}
    foreach ($line in Get-Content $path) {
        if ($line -match '^([^=]+)=(.*)$') {
            $result[$matches[1].Trim()] = $matches[2].Trim()
        }
    }
    return $result
}

function _profile_resolve_recursive([string]$name, [System.Collections.Generic.HashSet[string]]$visited, [System.Collections.Generic.List[string]]$chain) {
    if ($visited.Contains($name)) { return }
    [void]$visited.Add($name)
    $p = profile_parse $name
    $parent = $p['profile.extends']
    if ($parent -and $parent -ne '') {
        _profile_resolve_recursive $parent $visited $chain
    }
    [void]$chain.Add($name)
}

function profile_resolve_chain([string]$name) {
    $visited = [System.Collections.Generic.HashSet[string]]::new()
    $chain   = [System.Collections.Generic.List[string]]::new()
    _profile_resolve_recursive $name $visited $chain
    return ,$chain.ToArray()
}

function profile_merge([string[]]$names) {
    $lib     = [System.Collections.Generic.List[string]]::new()
    $theme   = [System.Collections.Generic.List[string]]::new()
    $install = [System.Collections.Generic.List[string]]::new()
    $seen_lib     = [System.Collections.Generic.HashSet[string]]::new()
    $seen_theme   = [System.Collections.Generic.HashSet[string]]::new()
    $seen_install = [System.Collections.Generic.HashSet[string]]::new()

    foreach ($name in $names) {
        $p = profile_parse $name
        if ($p['modules.lib'] -and $p['modules.lib'] -ne '') {
            foreach ($m in ($p['modules.lib'] -split '\s+')) {
                if ($seen_lib.Add($m)) { [void]$lib.Add($m) }
            }
        }
        if ($p['modules.theme'] -and $p['modules.theme'] -ne '') {
            foreach ($m in ($p['modules.theme'] -split '\s+')) {
                if ($seen_theme.Add($m)) { [void]$theme.Add($m) }
            }
        }
        if ($p['modules.install'] -and $p['modules.install'] -ne '') {
            foreach ($m in ($p['modules.install'] -split '\s+')) {
                if ($seen_install.Add($m)) { [void]$install.Add($m) }
            }
        }
    }

    return @{
        lib     = ,$lib.ToArray()
        theme   = ,$theme.ToArray()
        install = ,$install.ToArray()
    }
}

Export-ModuleMember -Function profile_parse, profile_resolve_chain, profile_merge
