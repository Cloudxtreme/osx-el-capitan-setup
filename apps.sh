apps=(
  alfred
  dropbox
  google-chrome
  appcleaner
  firefox
  spotify
  iterm2
  flux
  vlc
  nvalt
  transmission
  little-snitch
  flash-player
  endurance
  sublime-text
  bartender
  seil
  karabiner
  sourcetree
  infinit
  backblaze
  logitech-control-center
  logitech-unifying
  cheatsheet
  eve
  slate
  beardedspice
  mysqlworkbench
  node
  git
  cyberduck
  qlcolorcode
  qlstephen
  qlmarkdown
  quicklook-json
)

echo "installing apps."
brew cask install --appdir="/Applications" ${apps[@]}

# fonts
fonts=(
  font-input
  font-open-sans
  font-roboto
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}
