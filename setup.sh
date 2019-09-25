clear
echo "This will install a ClockworkPi based launcher on your Raspberry Pi"
echo "Please leave it plugged in and connected to WiFi/Ethernet throughout this process"
echo " "

# Dependencies
echo "Installing Dependencies..."
echo " "
sudo apt update
sudo apt dist-upgrade -y
sudo apt install -y retroarch mpd ncmpcpp \
git libuser python-wicd wicd wicd-curses \
python-pycurl python-alsaaudio python-pygame \
python-gobject python-xlib python-pip xorg git
pip install validators numpy requests 
echo " "

# File placement
echo "Making Directories..."
mkdir -p /home/pi/apps/emulators
mkdir -p /home/pi/games
mkdir -p /home/pi/music
echo " "
cd ~/apps/
echo "Downloading launcher..."
git clone https://github.com/turtleletortue/cpilauncherforpi launcher
echo " "
echo "Other necessary file placement..."
cd launcher
cp .xinitrc ~/.xinitrc

echo " "
echo "Reboot!"
sudo reboot

