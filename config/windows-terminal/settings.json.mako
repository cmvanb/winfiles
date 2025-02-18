<% from theme import color_hash %>\
{
    "$help": "https://aka.ms/terminal-documentation",
    "$schema": "https://aka.ms/terminal-profiles-schema",

    /* General
    ----------------------------------------------------------------------*/
    "copyFormatting": "none",
    "copyOnSelect": false,
    "newTabMenu":
    [
        {
            "type": "remainingProfiles"
        }
    ],

    /* Key bindings
    ----------------------------------------------------------------------*/
    "actions":
    [
        /* Unbind */
        {
            "command": "unbound",
            "keys": "alt+left"
        },
        {
            "command": "unbound",
            "keys": "alt+right"
        },
        {
            "command": "unbound",
            "keys": "alt+shift+minus"
        },
        {
            "command": "unbound",
            "keys": "alt+shift+plus"
        },
        {
            "command": "unbound",
            "keys": "ctrl+shift+pgup"
        },
        {
            "command": "unbound",
            "keys": "ctrl+shift+pgdn"
        },

        /* Basic */
        {
            "command": "newWindow",
            "keys": "ctrl+t",
        },
        {
            "command": "copy",
            "keys": "ctrl+c"
        },
        {
            "command": "paste",
            "keys": "ctrl+v"
        },
        {
            "command": "find",
            "keys": "ctrl+shift+f"
        },

        /* Navigation */
        {
            "command": { "action": "scrollDown", "rowsToScroll": 28 },
            "keys": "pagedown"
        },
        {
            "command": { "action": "scrollUp", "rowsToScroll": 28 },
            "keys": "pageup"
        },
        {
            "command":
            {
                "action": "moveFocus",
                "direction": "left"
            },
            "id": "User.moveFocus.2A0DA8E0",
            "keys": "ctrl+alt+h"
        },
        {
            "command":
            {
                "action": "moveFocus",
                "direction": "right"
            },
            "id": "User.moveFocus.87C324ED",
            "keys": "ctrl+alt+l"
        },
        {
            "command":
            {
                "action": "moveFocus",
                "direction": "up"
            },
            "keys": "ctrl+alt+k"
        },
        {
            "command":
            {
                "action": "moveFocus",
                "direction": "down"
            },
            "keys": "ctrl+alt+j"
        },

        /* Tab management */
        {
            "command": "closeTab",
            "keys": "ctrl+w"
        },
        {
            "command": "prevTab",
            "keys": "ctrl+h"
        },
        {
            "command": "nextTab",
            "keys": "ctrl+l"
        },
        {
            "command": {
                "action": "moveTab",
                "direction": "backward",
            },
            "keys": "ctrl+shift+h"
        },
        {
            "command": {
                "action": "moveTab",
                "direction": "forward",
            },
            "keys": "ctrl+shift+l"
        },

        /* Pane management */
        {
            "command": "closePane",
            "keys": "ctrl+alt+w"
        },
        {
            "command":
            {
                "action": "splitPane",
                "split": "right",
                "splitMode": "duplicate"
            },
            "id": "User.splitPane.FEF0D40B",
            "keys": "ctrl+alt+n"
        },
        {
            "command":
            {
                "action": "splitPane",
                "split": "down",
                "splitMode": "duplicate"
            },
            "id": "User.splitPane.10B260D2",
            "keys": "ctrl+alt+p"
        },

        /* Passthrough */
        {
            "command": {
                "action": "sendInput",
                "input": "\u0003"
            },
            "keys": "ctrl+x"
        }
    ],

    /* Profiles
    ----------------------------------------------------------------------*/
    "defaultProfile": "{574e775e-4f2a-5b96-ac1e-a2962a402336}",
    "profiles":
    {
        "defaults":
        {
            "antialiasingMode": "cleartype",
            "bellStyle": "window",
            "colorScheme": "Carbon Dark",
            "cursorShape": "filledBox",
            "experimental.retroTerminalEffect": false,
            "font":
            {
                "face": "IosevkaTerm Nerd Font"
            },
            "historySize": 10000,
            "intenseTextStyle": "bold"
        },
        "list":
        [
            {
                "commandline": "%SystemRoot%\\System32\\WindowsPowerShell\\v1.0\\powershell.exe -nologo",
                "guid": "{61c54bbd-c2c6-5271-96e7-009a87ff44bf}",
                "hidden": false,
                "name": "PowerShell 5"
            },
            {
                "commandline": "%SystemRoot%\\System32\\cmd.exe",
                "guid": "{0caa0dad-35be-5f56-a8ff-afceeeaa6101}",
                "hidden": false,
                "name": "Command Shell"
            },
            {
                "commandline": "\"C:\\Program Files\\PowerShell\\7\\pwsh.exe\" -nologo",
                "guid": "{574e775e-4f2a-5b96-ac1e-a2962a402336}",
                "hidden": false,
                "name": "PowerShell 7",
                "source": "Windows.Terminal.PowershellCore"
            },
            {
                "commandline": "wsl.exe ~",
                "guid": "{07b52e3e-de2c-5db4-bd2d-ba144ed6c273}",
                "hidden": false,
                "name": "WSL",
            }
        ]
    },

    /* Color schemes
    ----------------------------------------------------------------------*/
    "schemes":
    [
        {
            "name": "Carbon Dark",

            "background": "${color_hash('terminal_bg')}",
            "foreground": "${color_hash('terminal_text')}",
            "cursorColor": "${color_hash('terminal_text')}",
            "selectionBackground": "${color_hash('primary_15')}",

            "black": "${color_hash('ansi_black')}",
            "red": "${color_hash('ansi_red')}",
            "green": "${color_hash('ansi_green')}",
            "yellow": "${color_hash('ansi_yellow')}",
            "blue": "${color_hash('ansi_blue')}",
            "purple": "${color_hash('ansi_magenta')}",
            "cyan": "${color_hash('ansi_cyan')}",
            "white": "${color_hash('ansi_white')}",
            "brightBlack": "${color_hash('ansi_brblack')}",
            "brightRed": "${color_hash('ansi_brred')}",
            "brightGreen": "${color_hash('ansi_brgreen')}",
            "brightYellow": "${color_hash('ansi_bryellow')}",
            "brightBlue": "${color_hash('ansi_brblue')}",
            "brightPurple": "${color_hash('ansi_brmagenta')}",
            "brightCyan": "${color_hash('ansi_brcyan')}",
            "brightWhite": "${color_hash('ansi_brwhite')}",
        }
    ],
    "themes": []
}