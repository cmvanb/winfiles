# Winfiles

Windows dotfiles managed via a profile/module deployment system. Configs are symlinked (or copied) into their target locations; templates are rendered at deploy time.

## Quick orientation

| Concept | Location | Purpose |
|---|---|---|
| Entry point CLI | `deploy.ps1` | Install/uninstall profiles and modules |
| Profiles | `profiles/` | Declare module sets for specific hosts/roles |
| Modules | `modules/` | Per-app config + deploy script |
| Lib | `lib/` | Shared PowerShell utilities (fs, profile, system, template) |
| Extras | `extras/install.ps1` | One-time Scoop package installation |
| Theme | `modules/lib-theme/`, `modules/theme-base/` | Color/font/cursor system |

## Common tasks

```powershell
.\deploy.ps1 install --host          # deploy profile matching hostname
.\deploy.ps1 install <profile>       # deploy named profile (see profiles/)
.\deploy.ps1 install <module...>     # deploy one or more modules
.\deploy.ps1 uninstall               # uninstall using tracked state
.\deploy.ps1 status                  # show active profile
.\deploy.ps1 list                    # list all profiles and modules
.\deploy.ps1 show <profile>          # show resolved module set
.\deploy.ps1 install --dry-run       # print what would be installed
```

## Key conventions

- Modules live at `modules/<name>/deploy.psm1`; must define `install` and `uninstall` and export them via `Export-ModuleMember`
- Keep `install` and `uninstall` in sync — every file installed must be removed
- Profile files are plain key=value text in `profiles/`; profiles compose via `profile.extends=`
- Module install order within a profile: `modules.lib` → `modules.theme` → `modules.install`
- Templates use [Mako](https://www.makotemplates.org/); template files use a `.mako` infix and rendered output is never committed
- `link_or_copy` symlinks when running as admin or in developer mode; falls back to copy otherwise
- Deployment state is tracked in `~\.local\state\dotfiles\`

## Environment variables set by deploy.ps1

| Variable | Value |
|---|---|
| `XDG_CONFIG_HOME` | `$env:USERPROFILE\.config` |
| `XDG_CACHE_HOME` | `$env:USERPROFILE\.local\cache` |
| `XDG_DATA_HOME` | `$env:USERPROFILE\.local\share` |
| `XDG_BIN_HOME` | `$env:USERPROFILE\.local\bin` |
| `XDG_OPT_HOME` | `$env:USERPROFILE\.local\opt` |
| `XDG_SCRIPTS_HOME` | `$env:USERPROFILE\.local\scripts` |
| `DEPLOY_HOST` | `$env:COMPUTERNAME` (lowercased for profile lookup) |
| `DEPLOY_DISTRO` | `windows` |
| `DEPLOY_PROFILE` | Space-separated inheritance chain |

## Documentation

**Before making any changes, read the documentation files relevant to the task.**

- [docs/design.md](docs/design.md) — Design overview
- [docs/profiles.md](docs/profiles.md) — Profile format, inheritance, examples
- [docs/modules.md](docs/modules.md) — Module structure, deploy script API, patterns
