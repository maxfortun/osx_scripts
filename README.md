# osx_scripts

sudo port install python36

sudo port select --set python python36

sudo port select --set python3 python36

sudo port install py36-pip

sudo port select --set pip pip36

sudo pip install mac_alias

sudo pip install homeassistant

export PATH="$PATH:/opt/local/Library/Frameworks/Python.framework/Versions/3.6/bin"

run hass

it will autogenerate ~/.homeassistant

kill hass

edit ~/.homeassistant/configuration.yaml

Set http.api_password to something hard to guess 
Set http.server_host: 127.0.0.1

Add logger

logger:
  default: debug
  logs:
    homeassistant.components.device_tracker: debug
    homeassistant.components.camera: debug


Add wink 

wink:
  email: email@here
  password: password

Add broadlink

switch:
  platform: broadlink
  host: 192.168.1.8
  mac: '19:fa:ee:0d:43:b4'
  switches:
    tv:
      friendly_name: "TV Power"
      command_on: 'JgAYAZGVETkROBI4ERMRFBAUERQQFBA6ETgSOBETERQRExEUEBQQFBE5ERMRFBETERQRExETEjgRExI4ETkROBI4ETkROBEABg6UlRE4EjgRORETEBQRFBAUERQQORE5EDkSExAUERQQFBAVEBQQOhETERMRFBAUEBURExA5EhMRORE4ETkRORE4ETkRAAYRkZQSOBE5ETgSExETERMRFBETETkROBI4ERQRExETERQRExEUEDkRFBAUERMSExETERQROBEUETgRORE5ETgRORE4EgAGEJGVETkROBE5ERMRFBAUERMSExE4EjgRORETERQRExETERQRExE5ERMRFBETERMSExETETkRExE5ETgSOBE5ETgSOBEADQU='
      command_off: 'JgAYAZGVETkROBI4ERMRFBAUERQQFBA6ETgSOBETERQRExEUEBQQFBE5ERMRFBETERQRExETEjgRExI4ETkROBI4ETkROBEABg6UlRE4EjgRORETEBQRFBAUERQQORE5EDkSExAUERQQFBAVEBQQOhETERMRFBAUEBURExA5EhMRORE4ETkRORE4ETkRAAYRkZQSOBE5ETgSExETERMRFBETETkROBI4ERQRExETERQRExEUEDkRFBAUERMSExETERQROBEUETgRORE5ETgRORE4EgAGEJGVETkROBE5ERMRFBAUERMSExE4EjgRORETERQRExETERQRExE5ERMRFBETERMSExETETkRExE5ETgSOBE5ETgSOBEADQU='
    ac:
      friendly_name: "AC Power"
      command_on: "JgB4AAABHY4SEhMSEiMSERISEiQSERISEhISIxIjEhISEhISEiMSEhISEiMSIxIkEhETEhIjEhETERMjEiMSIxMREhISIxMRExESIxISEyITERISEhISERMjEhISERMRExESEhISERISIxMRExESEhMiExESEhISEQANBQ=="
      command_off: "JgB4AAABHY4SEhMSEiMSERISEiQSERISEhISIxIjEhISEhISEiMSEhISEiMSIxIkEhETEhIjEhETERMjEiMSIxMREhISIxMRExESIxISEyITERISEhISERMjEhISERMRExESEhISERISIxMRExESEhMiExESEhISEQANBQ=="


https://support.apple.com/en-us/HT203085


http://www.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers


https://github.com/robmathers/WhereAmI.git


# icalBuddy 1.8.8 from http://hasseg.org/icalBuddy/
git clone http://github.com/ali-rantakari/icalBuddy

git apply icalBuddy64.patch 

make clean

make 64BIT=true




