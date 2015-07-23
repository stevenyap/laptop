This is my personal laptop setup script using Ansible.

The objective of the script is to be able to setup a new Macbook automatically.

## Usage
- Clone the project
- `cd` into the cloned directory
- Run `./laptop.sh`

## Installed Items
Here's the list of items that the script installs:
- pip and ansible first in laptop.sh
- homebrew and cask
- List of brewed package and cask apps can be found in `homebrew/defaults/main.yml`
- Configure the macbook using my dotfiles and various other nusiance setup such as removing natural scroll, autohiding the dock
- Install solarized to iterm2
- Restore SSH key via symlinking to Dropbox

# TODOs
- Install hubstaff as cask
- Set keyboard shortcut Cmd-e to show desktop
- Set Mission Control to mouse button 3

# App Store to be installed manually
- Witch
- aText

# Can't Do
- Give accessibility permission to shiftit
- Set Caps Lock as Ctrl
- Turn off guest account
