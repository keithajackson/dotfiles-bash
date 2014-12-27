# dotfiles
*Copyright 2014, Caleb Evans*  
*Released under the MIT license*

## Introduction

My OS X shell setup is optimized for efficiency and convenience.

## Features

### Shells

OS X ships with Bash 3.2, however I use Bash 4 as my shell of choice. Bash 4 offers support for Unicode literals, and the more-performant Bash Completion 2 requires Bash 4.2 or newer. These reasons are enough for me to use Bash 4 over the bundled v3.2 shell.

#### Regarding zsh...

I prefer Bash over zsh because I have never found need for any the features which supposedly make it the superior shell. Additionally, I find Bash easier to use and configure for casual use, and it remains the most popular of existing UNIX shells.

### Packages

I use [Homebrew](http://brew.sh/) as my preferred package manager, which enables me to install all other packages required for my shell setup.

### Completion

I use Bash Completion 2.1 for tab completion on the command line. Bash Completion 2 offers significant performance advantages over its predecessor (v1.3), making it the optimal choice for my completion needs.

### Color highlighting

My setup enables color highlighting for a number of commands and interfaces. These include:

* `diff`
* `grep`, `egrep`, `fgrep`
* `less`
* `ls`

My setup also applies color highlighting when editing Git commit or merge messages in Vim.

### Interactive prompt

The `PS1` interactive prompt which I have set for my shell is intended to be concise, readable, and useful. The prompt displays the name of the current working directory, followed by the name of the current branch (if the directory is a git repository). Colons are used as separators, and spacing is utilized to improve readability.

#### Examples

* `~ : $`
* `my-dir : $`
* `my-repo : master : $`

## Setup Procedure

### Create symlinks

I recommend cloning this repository to the directory of your choice, preferrably using some cloud syncing service such as Dropbox. Then, you should create symlinks within your home directory pointing to the necessary files. These files include:

* `.bash_profile`
* `.bashrc`
* `.inputrc`

### Install Homebrew

You can install Homebrew using the following command:

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

My `.bashrc` expects that your Homebrew cellar is located at `/usr/local/bin`.

### Install Bash 4

To install and use Bash 4 as the default shell for OS X, proceed through the following steps:

#### Install latest version of Bash 4

```
brew install bash
```

#### Set Bash 4 as login shell

```
sudo chsh -s /usr/local/bin/bash $USER
```

### Install Bash Completion 2

Note that Bash Completion 2 requires Bash 4.2 or newer.

```
brew install homebrew/versions/bash-completion2
```

Note that if you have Git installed prior to installing Bash Completion, Git may not automatically install its completions. If this is the case, reinstalling Git should add the completions.

```
brew reinstall git
```

### Colorize `diff`

In my `.bash_profile`, I alias `diff` to `colordiff` if the latter is installed. Therefore, if you desire to enable color-coding for diff output, install the `colordiff` package via Homebrew:

```
brew install colordiff
```

### Install GNU `grep`

The GNU version of `grep` supports Perl regular expressions (PCRE) via the `-P` option. Installing the `grep` via Homebrew will enable this functionality.

```
brew install homebrew/dupes/grep --with-default-names
```

### Upgrade Vim (if on Ubuntu)

As described in [this
post](http://www.cyberciti.biz/faq/howto-install-full-vim-under-ubuntu-linux/),
Ubuntu Linux ships with a minimal version of Vim, which does not support syntax
highlighting. Therefore, to install the full version of Vim and thus enable
syntax highlighting, run the following shell command:

```
sudo apt-get install vim
```
