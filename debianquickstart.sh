#!/bin/bash
# DEBIAN QUICKSTART
# COPYRIGHT (C) 2021 0J3. ALL RIGHTS RESERVED.

#COLORS
CDEF=" \033[0m"                                     # default color
CCIN=" \033[0;36m"                                  # info color
CGSC=" \033[0;32m"                                  # success color
CRER=" \033[0;31m"                                  # error color
CWAR=" \033[0;33m"                                  # waring color
b_CDEF=" \033[1;37m"                                # bold default color
b_CCIN=" \033[1;36m"                                # bold info color
b_CGSC=" \033[1;32m"                                # bold success color
b_CRER=" \033[1;31m"                                # bold error color
b_CWAR=" \033[1;33m"                                # bold warning color

# echo like ...  with  flag type  and display message  colors
prompt () {
  case ${1} in
    "-s"|"--success")
      echo -e "${b_CGSC}${@/-s/}${CDEF}";;          # print success message
    "-e"|"--error")
      echo -e "${b_CRER}${@/-e/}${CDEF}";;          # print error message
    "-w"|"--warning")
      echo -e "${b_CWAR}${@/-w/}${CDEF}";;          # print warning message
    "-i"|"--info")
      echo -e "${b_CCIN}${@/-i/}${CDEF}";;          # print info message
    *)
    echo -e "$@"
    ;;
  esac
}

# Intro message
prompt -s "\t**** DEBIAN QUICKSTART"
prompt -i "\t  ** Copyright (c) 2021 0J3. All Rights Reserved"

# Check command avalibility
function has_command() {
  command -v $1 > /dev/null
}

  prompt -i "\t *** Updating Apt"
  apt update > /dev/null
  prompt -i "\t *** Installing common packages..."
  apt install git ssh firefox > /dev/null
  propmt -s "\t *** Installed common packages!"
  prompt -i "\t *** Downloading VSCode"
  wget https://az764295.vo.msecnd.net/stable/507ce72a4466fbb27b715c3722558bb15afa9f48/code_1.57.1-1623937013_amd64.deb --quiet
  prompt -i "\t *** Installing VSCode"
  apt install ./code_1.57.1-1623937013_amd64.deb > /dev/null
  propmt -s "\t *** Installed VSC!"
  prompt -i "\t *** Downloading Tor"
  wget https://www.torproject.org/dist/torbrowser/10.0.18/tor-browser-linux64-10.0.18_en-US.tar.xz --quiet
  prompt -i "\t *** Extracting Tor"
  tar -xvJf tor-browser-linux64-8.5.1_en-US.tar.xz
  prompt -i "\t *** Moving tor to /opt"
  cd tor-browser-linux64-8.5.1_en-US
  mv tor-browser_en-US /opt
  prompt -i "\t *** Installing Tor"
  cd /opt/tor-browser_en-US
  ./start-tor-browser.desktop --register-app > /dev/null
  propmt -s "\t *** Installed Tor!"
  propmt -i "\t *** Downloading Discord"
  wget https://dl.discordapp.net/apps/linux/0.0.15/discord-0.0.15.deb --quiet
  propmt -i "\t *** Installing Discord"
  apt install ./discord-0.0.15.deb > /dev/null
  propmt -s "\t**** DONE!!"
