PS1="\\n\\[\\033[1;32m\\]\\u\\[$(tput sgr0)\\] \\[$(tput sgr0)\\]\\[\\033[1;34m\\][\\w]\\[$(tput sgr0)\\] \\[$(tput sgr0)\\]\\[\\033[1;33m\\]\\n>>\\[$(tput sgr0)\\] \\[$(tput sgr0)\\]"

alias projects="cd ~/Documents/Projects/"
alias bashrc="micro ~/.bashrc"
alias m="micro"
#alias python="/home/idko/.local/share/python-venv/bin/python"
#alias pip="/home/idko/.local/share/python-venv/bin/pip"


update()
{
    /home/idko/Documents/bash-scripts/update.sh
}

t()
{
    /home/idko/Documents/bash-scripts/t.sh
}

cd()
{
    builtin cd "$@" && t
}

randomPhrase()
{
    /home/idko/Documents/bash-scripts/saySomething.sh
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
