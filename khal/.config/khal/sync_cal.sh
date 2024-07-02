#!/bin/zsh
echo "Running joe's calendar sync script"
echo $(date)
echo "Running vdirsyncer"
killall vdirsyncer &>/dev/null
if [ ! -f ~/.config/vdirsyncer/token_file ]; then
    echo "No google token file"
    vdirsyncer discover
fi
/opt/homebrew/bin/vdirsyncer sync
echo "Done. Share and Enjoy!"
