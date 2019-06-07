# user aliases
alias ytbaudio="youtube-dl -f 140 -i"
alias ytbvideo="youtube-dl -f 18 -i"
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
alias mpv="mpv --shuffle --no-audio-display"
alias mkexe="chmod u+x"
alias gcc="gcc-6"
