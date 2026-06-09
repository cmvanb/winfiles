# Winfiles System Design

## Goals

- **Declarative** — profiles compose modules; no imperative setup scripts
- **Instant updates** — configs are symlinked; editing source is immediately live
- **Dynamically themable** — Mako templates are re-rendered at deploy time
- **XDG-aligned** — paths follow XDG Base Directory conventions adapted for Windows

## Repository layout

```
winfiles/
├── deploy.ps1         # CLI entry point
├── profiles/          # profile files (key=value)
├── modules/           # per-app config + deploy.psm1
│   ├── lib-python-utils/  # template Python package (pip)
│   ├── lib-theme/         # theme runtime API
│   ├── theme-base/        # color/font/cursor YAML sources
│   └── <name>/
│       ├── src/       # config files, scripts, templates
│       └── deploy.psm1
├── extras/            # one-time setup scripts (not managed by profiles)
│   └── install.ps1    # Scoop packages + toolchain bootstrap
└── lib/               # shared PowerShell utilities
    ├── fs.psm1        # linking, copying, directory helpers
    ├── profile.psm1   # parse/resolve/merge profile files
    ├── system.psm1    # admin detection, registry, env vars
    └── template.psm1  # Mako template rendering
```

## Core concepts

### Profiles

Text files in `profiles/` that declare which modules to install via three module lists (`modules.lib`, `modules.theme`, `modules.install`) and optional `profile.extends` for composition.

→ [profiles.md](profiles.md)

### Modules

Self-contained units at `modules/<name>/`. A `deploy.psm1` defines `install` and `uninstall` functions exported via `Export-ModuleMember`. Install functions create directories, link or copy source files, and render templates.

→ [modules.md](modules.md)

### Theme system

Two cooperating modules (`lib-theme`, `theme-base`) provide a single source of truth for colors, fonts, and cursor across all apps. YAML source files are linked into `$XDG_CONFIG_HOME\theme\` and parsed into language-specific cache files at deploy time; runtime APIs (Bash, Fish, Lua, Python) load from cache.

### Templates

Mako templates (`.mako` infix, e.g. `settings.json.mako`, `theme.json.mako`) are rendered at deploy time via `python -m template`. Context includes theme color/font/cursor values and deploy environment variables. This enables theme injection and host/profile conditionals.

## Deployment flow

**Profile install**:

`.\deploy.ps1 install <profile>`

1. resolve inheritance chain
1. export `DEPLOY_*` vars
1. install `modules.lib` modules
1. install `modules.theme` modules
1. install `modules.install` modules
1. write state to `~\.local\state\dotfiles\`

**Module install**:

`.\deploy.ps1 install <module...>`

1. ensure directory structure with `ensure_directory`
1. link or copy configuration files with `link_or_copy`
1. render templates with `render_mako_template`

## Design decisions

| Decision | Rationale |
|---|---|
| Symlinks over copies | Edits are immediately live; `link_or_copy` degrades to copy gracefully when symlinks are unavailable |
| Profiles compose modules | Flexible; composition over inheritance |
| Mako template engine | Shared with Linux dotfiles; portable Python |
| `link_or_copy` not unconditional symlink | Windows requires admin or Developer Mode for symlinks; copy is the safe fallback |
| Depth-first profile resolution | Predictable merge order; child values win over parents |
