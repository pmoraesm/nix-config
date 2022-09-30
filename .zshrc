#### ZSH Options

## Git branch
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:*' formats ' (%F{green}%b%f)'

## Show current dir
setopt prompt_subst
PS1='%n@%m %~ $vcs_info_msg_0_ %# '

## Colored listing
export CLICOLOR=1
# export LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS=Gx
alias ls='ls -G'
alias ll='ls -ltrG'

##### App Aliases
source ~/.zsh/aliases

#### TuneIn SAML Options
# export SAML2AWS_SESSION_DURATION=43200


export PATH="/opt/homebrew/opt/protobuf@3/bin:$PATH"
export PATH="/Users/paulo/Library/Python/3.8/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
