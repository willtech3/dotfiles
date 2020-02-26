# rbenv stuff
eval "$(rbenv init -)"

# alias the change command
alias change="code-insiders ~/.zshrc"

# alias source to update
alias update="source ~/.zshrc"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# set syntax highlighting
source /usr/local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# use z.sh for quick directory lookup
. /usr/local/etc/profile.d/z.sh

# aliases for pretty ls commands in color
alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long'

# path anaconda
# export PATH="/Users/wwlane/anaconda3/bin:$PATH"  # commented out by conda initialize

function precmd () {
    window_title="\\033]0;${PWD##*/}\\007"
    echo -ne "$window_title"
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/wwlane/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/wwlane/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/wwlane/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/wwlane/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Adding this to the beginning of my path makes the Command-T extension in Vim work
# export PATH="/usr/local/opt/ruby/bin:$PATH"
