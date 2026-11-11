# Home-manager

My nix home-manager setup.
The idea is to configure all needed apps once (DRY princip in action).

> OS Version: MacOS Monterey 12.6
> Home-Manager Version: 22.11

## Installation

- install nix
- install home-manager
- install iterm2
- git pull and replace ~/.config/nixpkgs/ content bi this repo
- home-manage swith

## Usage

Right after installation all applications should be availabale and have proper configuration.
To apply any changes you need to:

```shell
home-manager switch          # macOS
home-manager switch --impure # linux
```

or short Fish shell abbreviation:

```shell
hms
```

Linux needs `--impure` because `~/.config/home-manager/home.nix` is a
symlink into this repo and a flake evaluated in pure mode refuses to follow
an absolute path out of its own source tree. Without the flag the switch
fails with `access to absolute path ... is forbidden in pure evaluation
mode`. The `hms` abbreviation carries the flag on linux.

## Shortcuts are bound to symbols, and this laptop types Dvorak

A GNOME shortcut names the symbol a key produces, not the key. Three
different names meet on one key here: keyd reports the hardware position in
QWERTY terms, the keycaps are QWERTZ, and the active layout is us+dvorak.
The key printed Z sits where QWERTY puts Y, keyd calls it y, and dvorak
makes it type f, so the shortcut that fires on it is written `<Control><Shift>f`.

Binding what the keycap says will not work. Bind the symbol the key types,
or pick something outside the letters - a function key, space, a digit -
which no layout moves.

## GUI programs stay on apt

wezterm was moved into nix on 2026-11-11 and would not open a window after
the reboot:

```
Failed to create window: with_egl_lib failed:
libEGL.so: cannot open shared object file
```

A nix-built GPU program looks for its graphics driver inside the nix store,
and on a non-NixOS host the driver lives in /usr/lib, so it finds nothing.
It was moved back to apt. The same trap waits for any other GPU-accelerated
program, so GUI ones belong to the distribution here and nix keeps the
command line tools.

## deskflow

`bin/setup-deskflow.sh <server-ip> [screen-name]` writes the three settings
that make the client sit in the tray and know who its server is. It refuses
to run while deskflow is open, because the app rewrites that file on exit,
which is also why home-manager does not own it.

Hotkeys do not belong here. keyd reads evdev and deskflow injects through
libei straight into the compositor, so keystrokes arriving from the other
machine never pass a single keyd rule. Remap on the machine the keyboard is
plugged into.

## keyd

`linux/apps/configs/keyd/default.conf` is the source of truth, but keyd is a
system daemon and reads `/etc/keyd/`, which home-manager cannot write. After
changing it, copy it across and restart the daemon:

```shell
bin/setup-keyd.sh
```

That script copies the file, restarts the daemon and clears the GNOME and
dock Super+number shortcuts that would otherwise swallow the layers.

Skip that and the file in git silently disagrees with the keyboard: on
2026-11-11 the two had been apart long enough that the copyq binding and the
Alt+Tab switcher had never once been live.

Note also that keyd sits on evdev, so it never sees keystrokes that arrive
over deskflow from another machine: those are injected into the compositor
through libei and bypass `/dev/input` entirely. Remapping for a keyboard
attached to the other machine has to happen on that machine.

## Scripts

`bin/amz` lands in `~/.local/bin/amz` and reads Amazon listings from this
machine. Claude Code's own WebFetch gets HTTP 503 from Amazon, so prices and
ratings had to be guessed from comparison sites; a browser user agent from a
home IP gets the real page.

```shell
amz search "verstellbare hanteln paar 24kg" -n 10   # ASIN, price, stars, ratings, title
amz item B0GZ93C7JM                                  # price, rating, stock, bullets, pair or single
amz raw B0GZ93C7JM                                   # path of the cached html
```

Responses are cached for six hours and requests are spaced 1.5 seconds apart.
Review text needs a signed-in session and is not fetched. Claude Code's auto
mode blocks the script as bot-check circumvention unless `Bash(amz *)` is in
the `permissions.allow` list of `~/.claude/settings.json`.

## To be done

These things is not automated due to lack of the time or beause of complexity.

### Fish

1. Make fish default system shell

   ```shell
   chsh -s /Users/dlavrushko/.nix-profile/bin/fish
   ```

### VSCode

Everything that was not done with VSCode is here.

1. Gruvbox theme
   My theme is not available as nix package, need to find out another way how
   to add it.
   This theme should be installed manually `Correia Github Gruvbox`
2. App in Applications (Spotlight) .
   These actions should add VSCode to the Spotlight: - Create Automator script
   (Run Shell) - Add
   `open /Users/dlavrushko/.nix-profile/bin/code && sleep 1 && pkill Terminal` -
   Save to Applications as `Code.app`

### Git

- --Need to add git under Nix control--
- Automate or descripe PGP key generation to have verified commits

### SSH

- Decide where store SSH keys
- Implement ssh config managed by Nix

### Direnv and asdf

- Implement asdf to be able to use it in some projects instead of Nix
- Marry direnv and Fish shell

### Go

- Language and its packages
