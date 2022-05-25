#!/bin/zsh
# lpass-wrapper.sh

username=joelewis101@doctors.org.uk

statz=$(/opt/homebrew/bin/lpass status)

if [ $? -ne 0 ]
then
    if [ "$statz" = 'Not logged in.' ]
    then
	# Make sure DISPLAY is set
	DISPLAY=${DISPLAY:-:0} /opt/homebrew/bin/lpass login "$username" 1>&2
    else
	echo "Lastpass error: $statz" 1>&2
	exit 1
    fi
fi

/opt/homebrew/bin/lpass $@
