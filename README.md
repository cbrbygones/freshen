# Freshen
This script automates the mirror ranking and refreshing process on Arch Linux, making it more efficient on the user's end.
It is important to keep mirrorlists up to date, since mirrrors can become bad and result in slower package updates/installs.

All information regarding Arch mirrors can be viewed on the [Arch Wiki](https://wiki.archlinux.org/title/mirrors).

__FEATURES__
+ Checks to see if the required `pacman-contrib` and `curl` packages are installed on the system.
+ Pulls the latest mirrors from a user's custom mirrorlist URL.
+ Automatically creates a backup before updating, and restores from it if an error occurs.

## Run

Ensure that, prior to running `freshen.sh`, the following variable is set to whatever URL works best for you.
It's recommended to use the [Pacman Mirrorlist Generator](https://archlinux.org/mirrorlist/) to tailor your own preferences...

    PACMAN_MIRRORLIST_URL="https://archlinux.org/mirrorlist/?country=US&protocol=https&use_mirror_status=on"

This URL will update itself with the best mirrors depending on your desired region, protocol, or IP version.

Next, give proper permissions to `freshen.sh` so it can run...

    chmod u+x freshen.sh
    ./freshen.sh

## Installation

Make sure `shc` is installed to compile the shell script into an executable binary.

    yay -S shc

Run `shc` afterwards to verify it has been installed, the makefile should run properly once it's set up.

    sudo make install

You should be able to execute the Freshen script through...

    sudo freshen
