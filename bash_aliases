# user aliases
alias ytbaudio="youtube-dl -f 140 -i"
alias ytbvideo="youtube-dl -f 43 -i"
alias inetchk="ping -c 5 duckduckgo.com"
alias gcc="gcc -g -Wall -o"
alias less="less --quit-at-eof"
alias PublicIP="dig +short myip.opendns.com @resolver1.opendns.com"
alias connect_usb0="sudo dhclient usb0"
# always pipe dict to less
lcmd () {
    "$@" | less
}
alias dict="lcmd dict"
alias search_pkg="sudo dpkg --list | grep "
alias mpv="mpv --shuffle --no-audio-display"
alias mkexe="chmod u+x"
