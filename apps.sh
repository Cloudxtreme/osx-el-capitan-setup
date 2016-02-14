apps=(
  alfred
  appcleaner
  backblaze
  bartender
  beardedspice
  cheatsheet
  cyberduck
  dropbox
  endurance
  eve
  firefox
  flash-player
  flux
  git
  google-chrome
  infinit
  iterm2
  karabiner
  little-snitch
  league-of-legends
  logitech-control-center
  logitech-unifying
  macdown
  mysqlworkbench
  node
  nvalt
  qlcolorcode
  qlmarkdown
  qlstephen
  quicklook-json
  seil
  silverlight
  slate
  sourcetree
  spotify
  sublime-text
  transmission
  vlc
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
