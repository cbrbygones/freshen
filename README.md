# Freshen
A script that automates the mirror refreshing process on Arch Linux so you can update better.

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