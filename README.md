# Dotfiles

This is my personal dotfiles repository. It contains the specific dotfiles,
alongside an installation script.

## Installation

To install the dotfiles, run one of the following commands:

```
curl -Lo - https://raw.githubusercontent.com/andreihh/dotfiles/main/installer/install.sh \
  | bash
```

```
wget -O - https://raw.githubusercontent.com/andreihh/dotfiles/main/installer/install.sh \
  | bash
```

After installing the dotfiles for the first time, you may need to restart your
system to reload the custom environment variables properly.

To add new dotfiles, commit all the changes to bring the repository to a clean
state and run the following command:

```
"${XDG_CONFIG_HOME}/dotfiles/installer/install_dotfiles.sh"
```

## XDG directories

The dotfiles follow the XDG specification where possible:
- https://specifications.freedesktop.org/basedir-spec/latest/index.html
- https://wiki.archlinux.org/title/XDG\_Base\_Directory

The XDG environment variables **must** be defined. By default, they are defined
in `~/.exports`.

## Private `~/.extras`

The `~/.extras` file should not be persisted across devices, and therefore is
not included in the repository. You should create it in the `$HOME` directory
and customize it appropriately. Example:

```
# ~/.extras: this file contains exported settings and installation paths for
# various software packages, making them available in interactive shells.

# Export Git credentials.
export GIT_AUTHOR_NAME="Andrei Heidelbacher"
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_AUTHOR_EMAIL="andrei.heidelbacher@gmail.com"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"

...
```

## Hotkeys

Keyboard layout changes:
- Swap `Caps Lock` with `Esc`
- Linux modifiers: `Super Alt Ctrl Space Alt Ctrl`
- MacOS modifiers: `Ctrl Opt Cmd Space Opt Cmd`

Common shortcuts (`C = Ctrl / Cmd`, `A = Alt / Opt`, `S = Shift`):
- New tab: `C-t`
- Close window / tab: `C-w`
- Quit app: `C-q`
- Cycle web browser tabs: `C-1` / `C-2`
- Cycle windows: `C-[S]-tab` (requires https://alt-tab-macos.netlify.app/)
- Zoom in / out: `C-=` / `C--`
- Toggle tiled left / right: `C-A-,` / `C-A-.`
- Toggle maximized: `C-A-m`
- Toggle fullscreen: `C-A-f`
- Print screen / cancel: `C-A-p` / `Esc`
- Lock screen: `C-A-l`
- Open file explorer: `C-A-e`
- Open web browser: `C-A-w`
- Open shell terminal: `C-A-s`
- Open `tmux` terminal in the `work` session: `C-A-x`

Terminal settings:
- Paste: `A-p`
- Close window: `C-q`
- Send interrupt signal: `C-c`
- Swap `Cmd` with `Ctrl` in `iTerm2`
- Do not remap modifiers `Cmd-[S]-Tab`, `` Cmd-` ``, `Cmd-q` in `iTerm2`

## Code formatters

Update the `nvm` and code formatter versions in the setup scripts as needed. The
code formatters are configured to use Google style where possible. The following
formatters are configured:
- `shfmt`
- `prettier`
- `yapf`
- `clang-format`
- `google-java-format`
- `ktfmt`

## Firefox Settings

Firefox settings in `about:config`:
- `browser.sessionstore.interval = 150000`
- `browser.cache.disk.enable = false`
- `browser.cache.memory.enable = true`
- `browser.cache.memory.capacity = -1`

## Licensing

The scripts and configurations are licensed under the MIT license.
