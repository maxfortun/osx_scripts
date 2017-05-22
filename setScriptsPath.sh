#!/bin/bash

path="$1"
[ -z "$path" ] && path=$(dirname $0)

swd=$(pwd)
cd $path
path=$(pwd)
cd $swd

defaults write ~/Library/Preferences/user scriptsPath "$path"
