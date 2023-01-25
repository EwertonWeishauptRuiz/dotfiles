sudo pacman -S i3 i3blocks noto-fronts-emoji git wget dmenu python-pip python-jedi yapf docker docker-compose keychain alsa-utils
pip install black autopep8 dbus-python
sudo cp -R ~/.config/i3blocks /usr/share/i3blocks
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

