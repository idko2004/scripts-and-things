#! /bin/bash
echo -e "We're at \033[1;33m$(pwd)\033[0m\n"
eza -1a --icons --group-directories-first
#tree -aCFL 1 --noreport --dirsfirst;

if [ -d "$PWD/.git" ]
then
	echo -e "\n\033[1;33mGit status:\033[0m"
	git status | cat
fi
