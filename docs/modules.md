# Modules

A module is a self-contained unit of configuration for one app or service. Each module lives at `modules/<name>/` and provides a `deploy.psm1` that defines install and uninstall functions.

## Directory layout

```
modules/<name>/
├── src/           # config files, scripts, templates
└── deploy.psm1    # install/uninstall functions
```

`extras/` holds one-time setup scripts (e.g. Scoop package installation) that are not part of the profile/module system.

## Deploy script structure

A `deploy.psm1` defines `install` and `uninstall` functions and exports them.

The install function resolves `$base_dir` from `$PSScriptRoot`, imports needed lib modules, then uses `link_or_copy` or `render_mako_template` to deploy files.

```powershell
$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force

function install {
    $src = "$base_dir\modules\<name>\src"
    ensure_directory "$env:XDG_CONFIG_HOME\<app>"
    link_or_copy -source "$src\config" -destination "$env:XDG_CONFIG_HOME\<app>\config"
}

function uninstall {
    force_delete "$env:XDG_CONFIG_HOME\<app>\config"
}

Export-ModuleMember -Function install, uninstall
```

## Shared library functions

### fs.psm1

| Function | Effect |
|---|---|
| `link_or_copy -source <src> -destination <dest>` | Symlinks when admin/developer mode, copies otherwise; falls back to copy on error |
| `force_copy -source <src> -destination <dest>` | Always copies; removes existing dest first |
| `force_delete <path>` | Removes a file, directory, or symlink |
| `ensure_directory <path>` | Creates the directory if it does not exist |
| `delete_link <path>` | Removes a symlink only |
| `make_shortcut <path> <target>` | Creates a `.lnk` shortcut via WScript.Shell |

### system.psm1

| Function | Effect |
|---|---|
| `is_admin` | Returns `$true` when running as Administrator |
| `is_developer` | Returns `$true` when a Windows Developer License is active |
| `set_registry_key <key> <name> <value>` | Sets a registry property |
| `unset_registry_key <key> <name>` | Removes a registry property |
| `set_env_var <name> <value>` | Persists a user environment variable via `HKCU:\Environment` |

### template.psm1

| Function | Effect |
|---|---|
| `render_mako_template -template <tpl> -target <dest>` | Renders a Mako template to `dest` via `python -m template` |

The `template` Python package is provided by the `lib-python-utils` module and must be installed before any template rendering.

## Common deployment patterns

**Link individual file**

```powershell
link_or_copy -source "$src\config" -destination "$env:XDG_CONFIG_HOME\<app>\config"
```

**Link entire directory**

```powershell
link_or_copy -source "$src" -destination "$env:XDG_OPT_HOME\<name>"
```

Use this when all files in `src\` are static and the destination is owned entirely by this module.

**Render template file**

```powershell
render_mako_template -template "$src\settings.json.mako" -target "$env:APPDATA\<app>\settings.json"
```

**Set a registry key**

```powershell
set_registry_key "HKCU:\Software\<Vendor>\<App>" "SettingName" "value"
```

## Example module

`modules/git/deploy.psm1`:

```powershell
$base_dir = Resolve-Path "$PSScriptRoot\..\.."

Import-Module "$base_dir\lib\fs.psm1" -Force
Import-Module "$base_dir\lib\system.psm1" -Force


function install {
    Write-Host "└> Installing git configuration."

    link_or_copy `
        -source "$base_dir\modules\git\src\.gitconfig" `
        -destination "$env:USERPROFILE\.gitconfig"

    link_or_copy `
        -source "$base_dir\modules\git\src\ignore" `
        -destination "$env:USERPROFILE\.config\git\ignore"
}

function uninstall {
    Write-Host "└> Uninstalling git configuration."

    force_delete "$env:USERPROFILE\.gitconfig"
    force_delete "$env:USERPROFILE\.config\git\ignore"
}

Export-ModuleMember -Function install, uninstall
```
