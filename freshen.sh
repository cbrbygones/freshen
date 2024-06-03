#!/usr/bin/bash

# Replace PACMAN_MIRRORLIST_URL with whatever region is closest to you: https://archlinux.org/mirrorlist/
# The FILE and BACKUP should be fine as is, and should be left alone.
PACMAN_MIRRORLIST_URL="https://archlinux.org/mirrorlist/?country=US&protocol=https&use_mirror_status=on"
PACMAN_MIRRORLIST_FILE=/etc/pacman.d/mirrorlist
PACMAN_MIRRORLIST_BACKUP=/etc/pacman.d/mirrorlist.backup

# Script determines if it's being ran as root. If not, the script exits.
# Checks the user's system to see if rankmirrors and pacman-contrib are installed, and installs them if needed.
if [[ $EUID -ne 0 ]]; then
    echo "The Freshen script needs to be ran as root."
    echo "Freshen (c) 2024-2024 https://github.com/cbrbygones/freshen"
    echo "This script is licensed under the GNU General Public License v3.0"
    exit 1
else
    echo "Starting the Freshen script..."
    echo "Freshen (c) 2024-2024 https://github.com/cbrbygones/freshen"
    echo "This script is licensed under the GNU General Public License v3.0"
fi

REQUIRED_PACKAGES=("pacman-contrib" "rankmirrors")
for pkg in "${REQUIRED_PACKAGES[@]}"; do
    if ! pacman -Qi $pkg &> /dev/null; then
        echo "$pkg is not installed. Installing $pkg..."
        pacman -S --noconfirm $pkg
    else
        echo "Required packages are installed. Creating a backup of the mirrorlist..."
    fi
done

cp $PACMAN_MIRRORLIST_FILE $PACMAN_MIRRORLIST_BACKUP

echo "Pulling the freshest, most active mirrors from $PACMAN_MIRRORLIST_URL..."
curl -s $PACMAN_MIRRORLIST_URL | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 6 - > $PACMAN_MIRRORLIST_FILE

# Check for errors, and restores the backup if needed.
if [[ $? -ne 0 ]]; then
    echo "There was an error while updating the mirrorlist, restoring backup..."
    cp $PACMAN_MIRRORLIST_BACKUP $PACMAN_MIRRORLIST_FILE
    exit 1
else
    echo "Your mirrors have been freshened up! Run \"pacman -Syyu\" to refresh your mirrors!"
fi