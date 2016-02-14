#!/bin/bash

xcode-select --install
echo "Run once to accept License Agreement"

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

binaries=(
  graphicsmagick
  webkit2png
  rename
  ffmpeg
  python
  trash
  node
  tree
  the_silver_searcher
  hub
  git
  bash-completion
  dnsmasq
  fontconfig
  freetype
  get-flash-videos
  mysql
  terminal-notifier
  tidy-html5
)

echo "Installing binaries..."
brew install ${binaries[@]}

brew cleanup

echo "Configuring dnsmasq"
cd $(brew --prefix)
mkdir etc
echo 'address=/.dev/127.0.0.1' > etc/dnsmasq.conf
sudo cp -v $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist /Library/LaunchDaemons
sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
sudo mkdir /etc/resolver
sudo bash -c 'echo "nameserver 127.0.0.1" > /etc/resolver/dev'

echo "Updating core utilities/bash"
# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

echo "Export path for coreutils"
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

echo ""
echo "Have you set up an ssh key for Git?  (y/n)"
read -r response
if [[ ! $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    ssh-keygen -t rsa -C "jeremyemiller@gmail.com"
    #copy ssh key to clipboard for adding to github.com
    pbcopy < ~/.ssh/id_rsa.pub
    echo "SSH key copied to clipboard"
fi

echo ""
echo "Install homebrew cask apps & fonts?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sh apps.sh
fi

echo ""
echo "Set up OSX defaults?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
    sh osxdefaults.sh
fi
