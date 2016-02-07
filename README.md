# Keith Jackson's dotfiles
*Released under the MIT license*

The automatically updating, portable bash dotfiles fun! Forked from [Caleb Evans' dotfiles](https://www.github.com/caleb531/dotfiles)]

### Prerequisites

1. Bash 4.2 (`brew install bash && s`)
2. Bash Autocomplete 2 (`brew install bash-autocomplete2`)
3. Git (for auto-update) (`brew install git`)

### Installation

Navigate to the root directory of `dotfiles` and run:

```sh
bash ./config/create_symlinks.sh
. ~/.bashrc
```

From now on, any changes to your shell can be applied immediately with the `reload` command.
