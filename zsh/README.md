# ZSH Config

Run the config.sh or follow the tutorial below.
## Oh-My-Zsh

Start by installing ZSH using your package manager, then you can install Oh-My-Zsh using

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

Now you need to change the terminal colorscheme to any Nord variant and the font to any Nerd Font variant, I personally use JetBrains Mono NF.

## Spaceship

Time to install spaceship-prompt, open your terminal again and paste this

```sh
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
```

Then create a link to themes folder

```sh
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
```

Now open up .zshrc and change the theme

```
ZSH_THEME="spaceship"
```

Now we just need to install some plugins.

## Plugins

We're gonna install the plugins using Zinit

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
```

Now open .zshrc and put these lines after ```## End of Zinit's installer chunk```

```
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
```

Then restart your terminal and the plugins will install.
Press 'y' to all and you're new Shell is completed

## Custom Configs (Optional)

Now for my customization, first install ```tmux``` and clone [Pfetch](https://github.com/dylanaraps/pfetch.git) repo into your Downloads folder
```sh
cd $HOME/Downloads && git clone https://github.com/dylanaraps/pfetch.git
```

Then just replace all .zshrc for this:

```
export ZSH="/home/lax/.oh-my-zsh"
ZSH_THEME="spaceship"

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  node		# Node version
  dotnet	# Dotnet version
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
### Configs
# user
SPACESHIP_USER_SHOW=always
# host
SPACESHIP_HOST_SHOW=always
# node
SPACESHIP_NODE_SHOW=always
# dotnet
SPACESHIP_DOTNET_SHOW=always
# prompt
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=true
# char
SPACESHIP_CHAR_SYMBOL="::"
SPACESHIP_CHAR_SUFFIX=" "

# Aliases

alias zshcf='cd ~ && nvim .zshrc'
alias vimcf='cd ~ && cd .config/nvim && nvim'
alias roficf='cd ~ && cd .config/rofi && nvim'
alias i3cf='cd ~ && cd .config/i3 && nvim'
alias polycf='cd JJ cd .config/polybar && nvim'

alias pfetch='cd ~ && clear && ./Downloads/pfetch/pfetch && cd ~'
alias network='nmtui'
alias ls='ls -a'
alias remove='rm -rf'

# Aliases

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

tmux
pfetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
```
