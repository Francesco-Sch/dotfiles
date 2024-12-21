#!/bin/sh

# Get the system type
# system type is an environment variable that stores the current operating system
# i.e. Darwin (Mac OS), Ubuntu (Linux), etc.
system_type=$(uname -s)

########## 
# Mac OS # 
##########
if [ "$system_type" = "Darwin" ]
then 
    echo "Running on Mac OS"

    # Install Homebrew
    if ! command -v brew &> /dev/null
    then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew is already installed."
    fi

    # Install Oh My Zsh
    if ! command -v zsh &> /dev/null
    then
        echo "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        echo "Oh My Zsh is already installed."
    fi
fi