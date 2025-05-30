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
    "I forgot the phrase"
    "NULL"
    "Preparing to hack..."
    "undefined"
    "I have your credit card information"
    "Hi"
    "The doctor said I had tomato loss"
    "Ancient aliens, it's all true"
    "Arch btw!"
    "Science was a masquerade, meant to sell you lemonade"
    "In man against machine. Machine will conquer all"
    "I know your name"
    "I'm offering to you a business proposal"
    "UFOlogy, yes, it's all real"
    "Is this the first time that you've ever seen Aurora Borealis crush mankind?"
    "'git gut' is not a git argument"
	"I'm in your sudoers file"
	"Falling down the stairs; star fruits, apples, grapes, and pears"
	"...?rosseforP yas I dluohs ro ,traehdloC .rM uoy tuoba woh ,owt"
	"rof aet deen I"
	"Owt-weM ot ecin ykcuL ykcuL"
	"Mold en Mono has a cold sharp scimitar"
	"My brain has claimed its glory over me"
	"Doctor, I can't tell if I'm not me"
	"My father works for Microsoft and will destroy your boot partition"
	"I STEPPED ON GUM! I STEPPED ON GUM! OHOHO!"
)

phraseNumber=$[$RANDOM % ${#allPhrases[@]}]

phrase=${allPhrases[$phraseNumber]}

cowsay -r $phrase

