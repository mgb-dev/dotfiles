# Welcome to my Dotfiles repo

Here is where all my terminal config lives
I'm currently using Ubuntu 22.04 LTS

## Usage
I use `GNU stow` to manage my dotfiles

here is a script to use my repo:

```bash
sudo apt install git

sudo apt install stow

git clone <repo_url>
cd dotfiles
stow .
```
