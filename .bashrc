#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '

#//////////////////////////////////////////////////////////////////////////////
#///////////////////////////COSAS QUE PONGO YO/////////////////////////////////
#//////////////////////////////////////////////////////////////////////////////

PS1='\n\[\e[32;1m\]\u\[\e[0;36m\](\h) \[\e[94;1m\][\W]\n\[\e[93m\]-> \[\e[0m\]'

alias projects="cd ~/Documents/Projects/"
alias bashrc="micro ~/.bashrc"
alias m="micro"
alias ssh-a01="ssh u0_a216@192.168.7.200 -p 8022"
alias ssh-j7="ssh u0_a216@192.168.7.202 -p 8022"
alias git-hard-reset="echo 'Are you sure? backup your local files' && sudo echo 'D:' && git fetch origin && git reset --hard origin/master"
alias git-soft-reset="git reset --soft HEAD^"
#alias python="/home/idko/.local/share/python-venv/bin/python"
#alias pip="/home/idko/.local/share/python-venv/bin/pip"
alias pacman="sudo pacman"

RANGER_LOAD_DEFAULT_RC=false

duplicate()
{
	alacritty --working-directory "${PWD}" >/dev/null & disown
}

update()
{
    /home/idko/Documents/Projects/scripts-and-things/update.sh
}

t()
{
    /home/idko/Documents/Projects/scripts-and-things/t.sh
}

cd()
{
    builtin cd "$@" && t
}

randomPhrase()
{
    /home/idko/Documents/Projects/scripts-and-things/saySomething.sh
}

theThingAtTheStart()
{
    if [[ $(pwd) = "/home/$(whoami)" ]]
    then
        randomPhrase
    else
        t
    fi
}

theThingAtTheStart

#//////////////////////////////////////////////////////////////////////////
#//////////////////////////////////////////////////////////////////////////

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
