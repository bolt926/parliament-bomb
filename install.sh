#!/usr/bin/env bash

welcome() {
    clear
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo -e "\033[1mparliamentbomb Installer\033[0m"
    echo "This will configure and install the parliamentbomb server side software to your machine." 
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "Make sure you read the README.md before continuing."
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo -e "\033[1mBrought to you by parliamentbomb contributors!\033[0m"
    echo "The source code for this installer is availale on GitHub."
    echo "Please consider contributing!"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "Press ENTER to continue..."
    read
}

usercheck() {
    clear
    if [ `id -u` == 0 ]; then
        echo -e "\e[1;31mroot account detected!\e[0m"
        echo
        echo "you are meant to run this script as the normal user."
        echo "please launch the script, and try again."
        exit 1
    fi
}

machinecheck() {
    echo -e "\033[1mVerify Machine | parliamentbomb installer\033[0m"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "To verify you're really installing this on a server or container, please enter the following (without quotes)"
    echo
    echo "'I know what I'm doing!'"
    echo
    echo "parliamentbomb Developers will NOT take responsibility if something wrong happens after installing this on your personal computer."
    echo "Please install this on a proper server or container, dedicated for parliamentbomb."
    echo
    echo "Do you know what you're doing?"
    echo
    read -p ">>> " user_input
    if [ "$user_input" == "I know what I'm doing!" ]; then
        echo "Thank you! Proceeding with the installation..."
        break
    else
        echo "Input does not match. Exiting the script."
    exit 1
    fi
}

install() {
    clear
    echo -e "\033[1mInstalling...\033[0m"
    mkdir -p /home/$USER/parliamentbomb/{src,logs}
    mkdir $XDG_CONFIG_HOME/parliamentbomb
    mv ./parliamentd/parliamentd.service $XDG_CONFIG_HOME/system/user/
    mv ./main.py /home/$USER/parliamentbomb/src/
    systemctl enable --user parliamentd
}

final() {
    clear
    echo -e "\033[1mInstallation complete! | parliamentbomb installer\033[0m"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "The installation is complete!"
    echo "make sure to edit the configuraiton files at $XDG_CONFIG_HOME/parliamentbomb"
    echo "parliamentd and parliamentbomb will now launch on the next startup."
}



welcome
usercheck
machinecheck
install
final

