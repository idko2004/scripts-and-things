# Welcome to my dot-files
These are what I would call the main configurations of my system, there are more, but I wouldn't consider those really relevant to have as a backup. These are mainly the configurations I want to have as a backup and to be able to replicate my setup on other machines.

These files are not really meant to be used by anyone else, you are free to do so, but don't expect things to be plug and play, you will have to tinker with stuff. I made this configurations and scripts to work in a way I like and to cover my specific use cases, and it will likely not cover yours, but if you find something that could be useful for you, go ahead and use it!

The way I made this repo was from manually copying the config files from their respective directories, so to apply them, you can just copy these files to their respective locations, or use symlinks idk, I highly recommend to not do that and instead read through these configs and paste the stuff you want on yours. Either way, make sure to backup your default configs first!

I currently use hyprland on arch (with NVIDIA on my pc), so keep that in mind when using some stuff (specially in the hyprland config)

# How this is laid out
## [`scripts/`](./scripts/)
I would say, the most interesting things from here.

Scripts that I use on the terminal, or that I have keybindings for. I use these all the time!!!

[More explanations in the directory itself...](./scripts/)

## [`.bashrc`](./.bashrc)
This is the configuration file that runs every time you open your terminal.

This is just copy-pasted directly and contains stuff that you don't have to copy, if you want to copy the entire thing, copy just the section between the comments `////COSAS QUE PONGO YO///` and `//////////////////`.

The PS1 line makes the prompt like this:
```
idko(arch-btw) [scripts-and-things]
->
```
but with color.

There are a couple of aliases that could be useful for you. and a couple of functions that are on [The scripts directory](./scripts/)

There is a function called `theThingAtTheStart()` that displays a random phrase at the start if you are in the home directory (as, if you just opened the terminal directly from the launcher), or displays the contents of the directory you're in (as, if you opened the terminal from the file explorer) using the scripts [saySomething.sh](./scripts/saySomething.sh) and [t.sh](./scripts/t.sh)

Also when you `cd`, `t.sh` gets run automatically

## [`laptop/`](./laptop/)
Here is the configurations I made for my laptop, they're mostly the same things, but in a laptop you have to care more about stuff like suspending, locking the screen (I don't really care about that on desktop), battery, bluetooth and wifi (well, some pc also have those, but mine doesn't) and so.

## Other stuff
The rest is really pretty self explanatory, and there isn't much going on.

The [`awesome`](./awesome/) stuff though, it's from before I moved to hyprland, and it's not really "mantained".
