#! /bin/bash
echo -e "We're at \033[1;33m$(pwd)\033[0m\n"
eza -1a --icons --group-directories-first
#tree -aCFL 1 --noreport --dirsfirst;

if [ -d "$PWD/.git" ]
then
	echo -e "\n\033[1;33mGit status:\033[0m"
	echo -e "Working as user \033[1;33m$(git config user.name)\033[0m($(git config user.email))"
	git status | cat
fi
