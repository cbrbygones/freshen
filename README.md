# Freshen
This script automates the mirror ranking and refreshing process on Arch Linux, making it more efficient on the user's end.
It is important to keep mirrorlists up to date, since mirrrors can become bad and result in slower package updates/installs.

All information regarding Arch mirrors can be viewed on the [Arch Wiki](https://wiki.archlinux.org/title/mirrors).

__FEATURES__
+ Checks to see if the required `pacman-contrib` and `rankmirrors` packages are installed on the system.
+ Pulls the latest mirrors from a user's [custom mirrorlist](https://archlinux.org/mirrorlist/).
+ Automatically creates a backup before updating, and restores from it if an error occurs.

## Run

Give proper permissions to `freshen.sh` so it can run...

    chmod u+x freshen.sh
    ./freshen.sh

## Installation

Make sure `shc` is installed to compile the shell script into an executable binary.

    yay -S shc

Run `shc` afterwards to verify it has been installed, the makefile should run properly once it's set up.

    sudo make install

You should be able to execute the Freshen script through...

    sudo freshen
