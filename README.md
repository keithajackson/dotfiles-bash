# dotfiles
*Copyright 2015, Caleb Evans*  
*Released under the MIT license*

## Introduction

This repository describes and features the configuration files for my Terminal,
as well as configuration for the applications and packages I use. Note that I am
an avid OS X user, and therefore most of these customizations are specific to OS
X. However, some of these customizations can also be applied to Linux systems.

## Setup

```
git clone -b feature/keith https://github.com/caleb531/dotfiles.git
cd dotfiles
./config/config-all.sh
```

## Features

### Bash 4

OS X ships with Bash 3.2, however I use Bash 4 as my shell of choice. Bash 4
adds Unicode literals, the new *globstar* option, and support for Bash
Completion 2. These reasons are enough for me to use Bash 4 over the bundled
v3.2 shell.

### Terminal theme

For my work in the Terminal, I created Material Colors, a minimalist theme which
utilizes Google's Material Design color palette. While the theme's
characteristics are largely founded in my personal tastes, I have chosen to
include the theme in this repository for your convenience.

### Completion

I use Bash Completion 2.1 for tab completion on the command line. Bash
Completion 2 offers significant performance advantages over its predecessor
(v1.3), making it the optimal choice for my completion needs.

### Color highlighting

My setup enables color highlighting for a number of commands and interfaces.
These include:

* `diff`
* `grep`, `egrep`, `fgrep`
* `less`
* `ls`
* `tree`

My setup also applies color highlighting when editing Git commit or merge
messages in Vim.

### Interactive prompt

The `PS1` interactive prompt which I have set for my shell is intended to be
concise, readable, and useful. The prompt displays the name of the current
working directory, followed by the name of the current branch (if the directory
is a git repository). Colons are used as separators, and spacing is utilized to
improve readability.

#### Examples

* `~ : $`
* `my-dir : $`
* `my-repo : master : $`

## Configuration scripts

For configuring fresh OS X installs, I have also created a serious of scripts
which automatically configures my shell, sets my preferred OS X preferences, and
installs packages, among other tasks. All of these scripts are located within
the `config/` directory. You can run these scripts altogether using
`config-all.sh`, or individually by executing the respective script.

Generally, it is most useful to execute `config/create-symlinks.sh`, which will
forcefully create/update the respective symlinks to these dotfiles within your
home directory.
