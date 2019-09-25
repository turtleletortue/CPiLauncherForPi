# GameShell launcher
This is the launcher for GameShell based on 320x240 resolution and D-Pad layout.
![Screenshot](https://github.com/clockworkpi/GameShellDocs/blob/master/screenshot.png)

# Create the necessary user and group
* User name: pi
* Password: pi
* Group ID: 31415 with group name: pifav

```
sudo groupadd pifav -g 31415  
sudo adduser pi pifav  
```

# Directory structure
```
/home/pi/
├── apps
│   ├── emulators
│   └── launcher <-Here we are
│       ├── Menu
│       ├── sys.py
│       └── truetype
├── games
│   ├── FreeDM
│   ├── MAME
│   └── nxengine
└── music
```
## Create the necessary directories
```
mkdir -p /home/pi/apps/emulators  
mkdir -p /home/pi/games  
mkdir -p /home/pi/music  
```

# Dependent packages
* validators, numpy, requests, python-mpd2, beeprint, python-pycurl, python-alsaaudio, python-pygame, python-gobject, python-xlib, python-wicd
* wicd (For Wi-Fi)
* mpd (For music player)

## Install dependent packages
```
sudo apt-get -y install mpd ncmpcpp git libuser
sudo apt-get -y install python-wicd  wicd wicd-curses python-pycurl python-alsaaudio python-pygame python-gobject python-xlib   

sudo apt-get -y install python-pip   
sudo pip install validators numpy requests python-mpd2
```

# Create “.mpd_cpi.conf” config

vim ~/.mpd_cpi.conf

```
music_directory    "/home/pi/music"
playlist_directory    "/home/pi/music/playlists"
db_file    "/home/pi/music/tag_cache"
log_file    "/tmp/mpd.log"
pid_file    "/tmp/mpd.pid"
state_file    "/home/pi/music/mpd_state"
sticker_file    "/home/pi/music/sticker.sql"
user    "pi"
bind_to_address    "/tmp/mpd.socket"
auto_update    "yes"
auto_update_depth    "3" 
input {
    plugin "curl"
}

audio_output {
    type    "alsa"
    name    "My ALSA Device"
}

audio_output {
    type    "fifo"
    name    "my_fifo"
    path    "/tmp/mpd.fifo"
    format    "44100:16:2"
}

filesystem_charset    "UTF-8"
```
