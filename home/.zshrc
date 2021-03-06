# -*- Mode: shell-script;coding:utf-8 -*- #
# Lines configured by zsh-newuser-install
export HISTFILE=~/.histfile
export HISTSIZE=500000
export SAVEHIST=500000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kakakaya/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z} r:|[-_.]=**' #'m:{a-zA-Z}={A-Za-z} r:|[-_.]=**'
zstyle ':completion:*:processes' menu yes select=2

if [[ ! -d ~/.zplug ]]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi
source "$HOME/.zplug/init.zsh"

autoload -Uz compinit
fpath=("$HOME/.zsh/completions" $fpath)
compinit
# End of lines added by compinstall

# ================ setopt/autoload/zstyle ================ #
setopt prompt_subst
setopt auto_pushd
setopt auto_menu
zstyle ':completion:*:default' menu select=1
setopt correct
setopt hist_ignore_dups
setopt share_history
setopt list_packed
setopt no_beep
setopt nolistbeep
setopt rm_star_wait
setopt EXTENDED_GLOB
setopt EXTENDED_HISTORY
setopt hist_expand
setopt hist_reduce_blanks
setopt re_match_pcre
#zsh内蔵エディタを使う
autoload -U zcalc
autoload -U zed
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2> /dev/null
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31' #kill の候補にも色付き表示
#入力途中の履歴補完
bindkey "^P" history-beginning-search-backward #-end
bindkey "^N" history-beginning-search-forward #-end
setopt notify            # バックグラウンドジョブの状態変化を即時報告
export HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] " #ヒストリの一覧を読みやすい形に変更
export LISTMAX=1000 #補完リストが多いときに尋ねない

#================ npm ================
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
    _npm_completion () {
        local si="$IFS"
        IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                                         COMP_LINE="$COMP_LINE" \
                                         COMP_POINT="$COMP_POINT" \
                                         npm completion -- "${COMP_WORDS[@]}" \
                                         2>/dev/null)) || return $?
        IFS="$si"
    }
    complete -F _npm_completion npm
elif type compdef &>/dev/null; then
    _npm_completion() {
        si=$IFS
        compadd -- "$(COMP_CWORD=$((CURRENT-1)) \
                               COMP_LINE=$BUFFER \
                               COMP_POINT=0 \
                               npm completion -- "${words[@]}" \
                               2>/dev/null)"
        IFS=$si
    }
    compdef _npm_completion npm
elif type compctl &>/dev/null; then
    _npm_completion () {
        local cword line point words si
        read -Ac words
        read -cn cword
        let cword-=1
        read -l line
        read -ln point
        si="$IFS"
        IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                                     COMP_LINE="$line" \
                                     COMP_POINT="$point" \
                                     npm completion -- "${words[@]}" \
                                     2>/dev/null)) || return $?
        IFS="$si"
    }
fi
compctl -K _npm_completion npm
#================ npm end ================

# Alias config
if [ -f ~/.alias ]; then
    source "$HOME/.alias"
else
    echo "$HOME/.alias not found."
fi
#================ PROMPT ================ #
export PROMPT='
[%n@%m$(current-battery)]<${LINENO}/%!>:%F{cyan}%~%f
%#'
if [ "$COLORTERM" -eq 1 ]; then
    export RPROMPT="%(?.%F{green}٩('ω')و%f.%F{red}（˘⊖˘）oO[%?]%f)%*";
else
    export RPROMPT="%(?.%F{green}('_'%)%f.%F{red}(;_;%)[%?]%f)%*";
fi
export PROMPT2="%_%%>"

export SPROMPT="( 'ω')ノ '%R' を '%r' に直す？ [nyae]"

[ $(echo "$ZSH_VERSION" | cut -c1) -ge 5 ] && zle_highlight=(default:bold,fg=yellow, isearch:fg=red)

# EXEC
# autojump
# if [[ -e /usr/share/autojump/autojump.sh ]];then . /usr/share/autojump/autojump.sh ;fi
# local zsh files
[ -f "$HOME/bin/zshexec.sh" ] && "$HOME/bin/zshexec.sh"
([ ! -f ~/.zshrc.zwc ] || [ ~/.zshrc -nt ~/.zshrc.zwc ]) && zcompile ~/.zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm" # gvm configure
[ -f /home/kakakaya/.travis/travis.sh ] && source /home/kakakaya/.travis/travis.sh

if [[ -d $HOME/.local/google-cloud-sdk ]]; then
    # The next line updates PATH for the Google Cloud SDK.
    source '/home/kakakaya/.local/google-cloud-sdk/path.zsh.inc'

    # The next line enables shell command completion for gcloud.
    # source '/home/kakakaya/.local/google-cloud-sdk/completion.zsh.inc'

    # bashcompinit raises parse error
fi

for file in ~/.zsh/*.zsh; do
    source "$file"
done

# Display Zsh version and display number
# printf "\n$fg_bold[cyan]This is ZSH $fg_bold[red]${ZSH_VERSION}"
# printf "$fg_bold[cyan] - DISPLAY on $fg_bold[red]$DISPLAY$reset_color\n\n"
