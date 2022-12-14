# home-manager
My nix home-manager setup

## Installation
- install nix
- install home-manager
- install iterm2
- git pull and replace ~/.config/nixpkgs/ content bi this repo
- home-manage swith

## Usage

## Not done part
### VSCode
Everything that was not done with VSCode is here.
#### Gruvbox theme
My theme is not available as nix package, need to find out another way how to add it.
1. This  theme should be installed manually `Correia Github Gruvbox`
#### App in Applications (Spotlight)
This part should add VSCode to the Spotlight.
1. Create Automator script (Run Shell)
2. Add `open /Users/dlavrushko/.nix-profile/bin/code && sleep 1 && pkill Terminal`
3. Save to Applications as `Code.app`
