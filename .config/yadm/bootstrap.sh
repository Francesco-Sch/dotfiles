#!/bin/zsh

# CONFIG
BREWFILE_PATH="$HOME/.config/brewfile/Brewfile"

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

    # Install Oh My Zsh
    if ! command -v zsh &> /dev/null
    then
        echo "Installing Oh My Zsh..."
        /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        echo "Oh My Zsh is already installed."
    fi

    # Install Homebrew
    if ! command -v brew &> /dev/null
    then
        echo "Installing Homebrew..."
        /bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "Homebrew is already installed."
    fi

    # Install mas (Mac App Store) CLI
    if ! command -v mas &> /dev/null
    then
        echo "Installing mas CLI..."
        brew install mas
    else
        echo "mas CLI is already installed."
    fi

    # Install apps from Brewfile
    if [ -f "$BREWFILE_PATH" ]; then
        echo "Installing packages from Brewfile at $BREWFILE_PATH..."
        brew bundle --file="$BREWFILE_PATH"
    else
        echo "No Brewfile found at $BREWFILE_PATH"
    fi
fi
