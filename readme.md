# Marko's dotfiles.

Some essential settings for Bash, Vim, Screen etc.

Based on [Mathias's dotfiles](https://github.com/mathiasbynens/dotfiles/).

## Overview of files

####  Automatic config
* `.vimrc`, `.vim` - vim config, obv.

#### shell environment
* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.exports`
* `.functions`
* `.extra` - not included, for  private config which you do not commit to this repo
* `.inputrc` - config for bash readline

## Installation

```bash
git clone https://github.com/walokra/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing (such as [detecting which version of `ls` is being used](.aliases#L21-26)) takes place.

Here’s an example `~/.path` file that adds `~/utils` to the `$PATH`:

```bash
export PATH="$HOME/utils:$PATH"
```

### Add custom commands without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./.macos
```

## Thanks to…
* [Mathias Bynens](http://mathiasbynens.be/) and his [dotfiles repository](https://github.com/mathiasbynens/dotfiles/)

