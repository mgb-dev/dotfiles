# Welcome to my Dotfiles repo

Here is where all my terminal config lives
I'm currently using Ubuntu 22.04 LTS

## Usage
I use `GNU stow` to manage my dotfiles

here is a script to use my repo:

```bash
# navigate to the home directory, since the config files live there
cd ~

# OPTIONAL.
# git and stow are generally pre-install in Debian distros
sudo apt install git
sudo apt install stow

# Download the repo
git clone <repo_url>

# navigate into the directory
cd dotfiles

#Execute the stow program with "."(current directory) as a paramater and hit <Enter>
stow .
```

> :info: I choose the  `stow .` expression instead of the more common `stow *` because is more simple for me to "mirror" the home directory as is, instead of subfoldering everything (to be decided)
