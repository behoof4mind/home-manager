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
home-manager switch
```

or short Fish shell abbreviation:

```shell
hms
```

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
    My theme is not available as nix package, need to find out another way how to add it.
    This  theme should be installed manually `Correia Github Gruvbox`
2. App in Applications (Spotlight) .
These actions should add VSCode to the Spotlight:
    - Create Automator script (Run Shell)
    - Add `open /Users/dlavrushko/.nix-profile/bin/code && sleep 1 && pkill Terminal`
    - Save to Applications as `Code.app`

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
