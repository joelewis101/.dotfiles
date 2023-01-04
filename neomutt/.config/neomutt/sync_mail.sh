#!/bin/zsh
echo "Running joe's mail sync script"
echo  $(date)
echo "Running imapfilter/bogofilter"
killall imapfilter &> /dev/null
/opt/homebrew/bin/imapfilter
echo "Running mbsync"
killall mbsync &>/dev/null
/opt/homebrew/bin/mbsync -a 
echo "Running notmuch"
killall notmuch &>/dev/null; 
/opt/homebrew/bin/notmuch new 
# echo "Running bogofilter"
# /Users/joelewis/.config/neomutt/bogofilter_spam.sh
echo "Done. Share and Enjoy!"
