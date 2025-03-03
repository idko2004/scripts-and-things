# Scripts!!!!
Here I have a variety of scripts that I use on various situations, some are for the terminal, to be run automatically at startup or to be asociated with keybindings.

Some need a javascript engine to run (specially the ones that end on .js), I don't know the compatibility of what runtines work or not, I used node v22.4.0 installed with nvm.

## [`changeAudioDevice.js`](./changeAudioDevice.js)
As it's name implies, it changes the default audio device.

I don't know if it works on all setups, it works on my setup of Headphones connected through the front panel, and a TV through HDMI on an NVIDIA card.

It doesn't require anything from npm, but it does require the commands `pactl` and `notify-send` to be installed.

I have this command binded to `SUPER + S` on hyprland.

## [`notifyUpdate.js`](./notifyUpdate.js)
Sends a notification if 10 days have passed since the last system update.

This is meant to run at startup and to be used with [`update.sh`](./update.sh).

`update.sh` writes the date it was executed at `~/.config/last-updated`. `notifyUpdate.js` reads that file and if it was more than 10 days ago, sends a notification telling you to update.

## [`update.sh`](./update.sh)
An easy way to handle updating various package managers.

It handles apt, dnf, zypper, flatpak, pacman, yay and paru. Also runs reflector if you have that installed.

The most comfortable way of using this is to create an alias that points to this script in your `.bashrc`

### IMPORTANT
If you have reflector installed, make sure to set up property the variable `REFLECTOR_COUNTRIES`, or, if you don't want the script to be messing with reflector, change `USE_REFLECTOR` to 0.

Also, as pacman tends to accumulate a lot of cache, the script will **`rm -fr`** the directory `/var/cache/pacman/pkg/*`, and if you have paru or yay installed, it will also remove `~/.cache/paru/*` and `~/.cache/yay/*`. To stop this, change the variable `DELETE_ARCH_CACHE` to 0.

## [`t.sh`](./t.sh)
This script tells you what's in your current directory.

It just tells your in what directory you're in, runs eza to show you the contents of the directory, and if there is a `.git` folder, runs `git status`.

I have this aliased to `t` and to run automatically if the directory is not home in `theThingAtTheStart` on my `.bashrc`.

## [`screenfilter.sh`](./screenfilter.sh)
I had a problem that if I runned wlsunset while there was alredy an instance of wlsunset running, if you did `pkill wlsunset`, it would no longer work. I know this is a very niche problem to have.

This script just runs `wlsunset` in a very specific configuration that makes it work instantly and not gradually, and sets the screen brightness to the minimum, but only if `wlsunset` is not alredy running.

This is useful if you are watching videos in the dark, like an anime or a series or something, and the video changes between dark areas and bright areas all the time, so you set up keybindings to set a night filter and to kill the night filter.

## [`saySomething.sh`](./saySomething.sh)
This script is meant to run automatically when opening a terminal. It uses cowsay to say various random phrases. Make sure to change the phrases to references that you like!

Also, the cows may vary depending on your system. There was a command to list all the available cows, but I can't be bothered to look for it.

## [`themeChange/`](./themeChange/)
A series of scripts that modify configurations files of various programs to change dark and light themes.

In `main.sh` uncomment the ones you want, and comment the ones you don't want.

Then, open the scripts that you want and change the paths and themes.

**`MAKE SURE TO BACKUP YOUR CONFIG FILES BEFORE RUNNING THIS, THIS CAN BREAK APPLICATIONS`**

This is meant to be run at startup.