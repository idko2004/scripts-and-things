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

PS1='\n\[\e[97;101;1m\] GALAXY A01 \[\e[0m\] \[\e[92;1m\][\W]\n\[\e[91m\]\\$\[\e[0m\] '

alias projects="cd ~/projects/"
alias bashrc="micro ~/.bashrc"
alias m="micro"

t()
{
    /data/data/com.termux/files/home/scripts/t.sh
}

cd()
{
    builtin cd "$@" && t
}

#//////////////////////////////////////////////////////////////////////////
#//////////////////////////////////////////////////////////////////////////
