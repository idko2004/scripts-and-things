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
    "Arch btw!"
    "Awesome!"
    "Science was a masquerade, meant to sell you lemonade"
    "In man against machine. Machine will conquer all"
    "I know your name"
    "I'm offering to you a business proposal"
    "And you can own YourName.Com"
    "UFOlogy, yes, it's all real"
    "Is this the first time that you've ever seen Aurora Borealis crush mankind?"
    "'git gut' is not a git argument"
	"I'm in your sudoers file"
	"There will be blood"
	"A place to empty the mind"
	"Falling down the stairs; star fruits, apples, grapes, and pears"
	"...?rosseforP yas I dluohs ro ,traehdloC .rM uoy tuoba woh ,owt"
	"rof aet deen I"
	"Owt-weM ot ecin ykcuL ykcuL"
	"Mold en Mono has a cold sharp scimitar"
)

phraseNumber=$[$RANDOM % ${#allPhrases[@]}]

phrase=${allPhrases[$phraseNumber]}

#Select the command

commandNumber=$[$RANDOM % 10 + 1]

if [[ $commandNumber -gt 4 ]]
then
	sleep 0.1
    figlet $phrase -w `tput cols` | lolcat
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
