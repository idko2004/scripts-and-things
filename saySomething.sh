#! /bin/bash
#Select the phrase

allPhrases=(
    "Hacking Something..."
    "[object Object]"
    "Sudo password is 1234"
    "undefined is not an object"
    "Stealing your wifi password..."
    "Sudo make me a sandwich"
    $RANDOM$RANDOM$RANDOM
    "Can you fix my printer?"
    "Hacking your Facebook..."
    "%RANDOM_PHRASE%"
    "I forgot the phrase"
    "NULL"
    "Preparing to hack..."
    "undefined"
    "I have your credit card information"
    "Hi"
    "The doctor said I had tomato loss"
    "Ancient aliens, it's all true"
    "Fedora 36"
    "Awesome!"
)

phraseNumber=$[$RANDOM % ${#allPhrases[@]}]

phrase=${allPhrases[$phraseNumber]}

#Select the command

commandNumber=$[$RANDOM % 10 + 1]

if [[ $commandNumber -gt 4 ]]
then
    figlet $phrase -w `stty size | cut -d" " -f2`| lolcat -r
else
    allCows=("beavis.zen" "blowfish" "bud-frogs" "bunny" "cheese" "cower" "default" "dragon" "dragon-and-cow" "elephant" "elephant-in-snake" "eyes" "flaming-sheep" "fox" "ghostbusters" "head-in" "hellokitty" "kiss" "kitty" "koala" "kosh" "luke-koala" "meow" "milk" "moofasa" "moose" "mutilated" "ren" "sheep" "skeleton" "small" "stegosaurus" "stimpy" "supermilker" "surgery" "telebears" "three-eyes" "turkey" "turtle" "tux" "udder" "vader" "vader-koala" "www")


    cowNumber=$[$RANDOM % $((${#allCows[@]} + 5))] #dejar 5 extras para default

    #elegir con que vaca nos identificamos hoy
    if [[ $cowNumber -gt  $((${#allCows[@]} - 1)) ]]
    then
        cow="default"
    else
        cow=${allCows[$cowNumber]}
    fi

    cowsay -f $cow $phrase
fi
