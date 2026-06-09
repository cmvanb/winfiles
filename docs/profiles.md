# Profiles

Profiles declare which modules to install for a specific host or role. They are plain key=value files in `profiles/`.

## Format

```
profile.extends=<parent>    # parent profile name (optional)

modules.lib=<modules>       # library modules — installed first
modules.theme=<modules>     # theme modules — installed second
modules.install=<modules>   # application modules — installed third
```

Comments and blank lines are ignored.

## Inheritance

`profile.extends` names a single parent profile. Resolution is recursive depth-first, parents before children, each profile appearing once. Module lists are merged additively; duplicates across the chain are dropped.

## Examples

**`profiles/workstation`** — standard Windows desktop environment:

```
profile.extends=

modules.lib=lib-python-utils lib-theme
modules.theme=theme-base
modules.install=alacritty bat eza git keymapper less nvim powershell powertoys scripts starship vscode windows-terminal
```

**`profiles/cyxwel`** — host profile extending workstation:

```
profile.extends=workstation
```

## Implementation

Profile parsing and resolution live in `lib/profile.psm1`:

| Function | Purpose |
|---|---|
| `profile_parse <name>` | Parse a profile file into a hashtable |
| `profile_resolve_chain <name>` | Return the linearised inheritance chain as an array |
| `profile_merge <names[]>` | Merge a chain of profiles into a single `@{lib; theme; install}` hashtable |
