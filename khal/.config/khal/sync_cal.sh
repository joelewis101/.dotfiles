#!/bin/zsh
echo "Running joe's calendar sync script"
echo $(date)
echo "Running vdirsyncer"
killall vdirsyncer &>/dev/null
/opt/homebrew/bin/vdirsyncer sync
echo "Done. Share and Enjoy!"
