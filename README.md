# @mgb-dev's dotfiles repository

Here is where all my terminal & CLI tooling configuration lives.

## Description

This repository is based on the usage and structure of `GNU stow`.
every _package_ (folder) in this repo, contains the structure in which the symlink (for that particular config file) will be created.
The reasons to choose `GNU stow` over any other "dotfiles management tool", are 3:

### 1. Simplicity

`GNU stow` is very simple to use, setup and iterate into.

### 2. Ubiquity

`GNU stow` exists as a default tool on a lot of UNIX based systems. Or its 4 cli words away: `sudo <pkg-manager> install stow`
Which makes it the perfect tool to have at hand if we want portability for configuration files.

### 3. Support

`GNU stow`, as its name implies, is being developed, maintained and updated by the GNU organization. Which means:

- Backwards compatibility
- Long time support

## Installation

> ℹ️ NOTE: This repository requires `git` and `stow` to be installed and in you `$PATH`

Navigate to the `$HOME` directory (_parent directory_ in stow terms)

```bash
cd ~
```

Download the repo

```bash
git clone <repo_url>
```

Navigate into the repo's directory

```bash
cd dotfiles
```

Install all packages

```bash
stow *
```

## Uninstall

You also have the option to remove every symlink created by stow.
Just run the following command:

```bash
cd ~/dotfiles && stow -D
```

## Credits

- [gnu stow](https://www.gnu.org/software/stow/)

## License
