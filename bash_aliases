# user aliases
alias ytbaudio="python3 /usr/local/bin/youtube-dl -f 140 -i"
alias ytbvideo="python3 /usr/local/bin/youtube-dl -f 18 -i"
alias inetchk="ping -c 5 duckduckgo.com"
alias less="less --quit-at-eof"
alias PublicIP="dig +short myip.opendns.com @resolver1.opendns.com"
alias connect_usb0="sudo dhclient usb0"
# always pipe dict to less
lcmd () {
    "$@" | less
}
alias dict="lcmd dict"
alias search_pkg="dpkg --list | grep "
alias dsync="rsync -avh --progress -e ssh"
alias mpvaud="mpv --shuffle --no-audio-display"
alias ftree="ls -lRh"
alias mkexe="chmod u+x"
alias ggo="gcc -Wall -g -o"
