#-------------------------------------------------------------------------------
# Install windows user packages
#-------------------------------------------------------------------------------

# TODO: Verify whether scoop is installed.

scoop bucket add extras
scoop bucket add nerd-fonts

scoop install autohotkey
scoop install bat
scoop install delta
scoop install eza
scoop install fnm
scoop install git
scoop install IosevkaTerm-NF-Mono
# TODO: Install keymapper manually, scoop package isn't working properly.
# scoop install keymapper
scoop install less
scoop install neovim
scoop install ripgrep
scoop install starship
scoop install uv
# scoop install vscode
scoop install zig
scoop install zoxide

fnm install "v25.1.0"
