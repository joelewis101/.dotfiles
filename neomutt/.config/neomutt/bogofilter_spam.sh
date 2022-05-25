#!/bin/zsh

echo "Checking doctors.org"
SRC=~/Mail/doctors/INBOX/new
DST=~/Mail/doctors/Spam/new

if [ -n "$(ls $SRC)" ]
then
        echo "Mail tagged as new"
        echo "Checking..."
        #FILES=$(rg -l -F "Received" $SRC)
        COUNT=0
        FILES=($SRC/*)
        #echo $FILES
        for file in $FILES; do
                RESULT=$(/opt/homebrew/bin/bogofilter -o0.5 -I $file -v) 
            #echo $file
            #echo $RESULT
            filename=$(basename $file)
            #echo $filename
            if [[ $RESULT == *Spam* ]]; then
                    if ! grep -q "\[Bogon\]" $file; then
                       /opt/homebrew/bin/bogofilter -o0.5 -I $file -p --spam-subject-tag "[Bogon]" > ~/tmp/$filename
                       rm $file
                       mv ~/tmp/$filename $file
                       #echo "SPAM!!!"
                       COUNT=$((COUNT+1))
                    fi
            fi
        done

        echo $COUNT "new bogons identfied"

else
        echo "No new mails to check"
fi


echo "Checking UoL"
SRC=~/Mail/UoL/INBOX/new
DST=~/Mail/UoL/Junk/new

if [ -n "$(ls $SRC)" ]
then
        echo "Mail tagged as new"
        echo "Checking..."
        #FILES=$(rg -l -F "Received" $SRC)
        COUNT=0
        FILES=($SRC/*)
        #echo $FILES
        for file in $FILES; do
                RESULT=$(/opt/homebrew/bin/bogofilter -o0.5 -I $file -v) 
            #echo $file
            #echo $RESULT
            filename=$(basename $file)
            #echo $filename
            if [[ $RESULT == *Spam* ]]; then
                    if ! grep -q "\[Bogon\]" $file; then
                       /opt/homebrew/bin/bogofilter -o0.5 -I $file -p --spam-subject-tag "[Bogon]" > ~/tmp/$filename
                       rm $file
                       mv ~/tmp/$filename $file
                       #echo "SPAM!!!"
                       COUNT=$((COUNT+1))
                    fi
            fi
        done

        echo $COUNT "new bogons identfied"

else
        echo "No new mails to check"
fi
