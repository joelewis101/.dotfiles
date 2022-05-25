Joe's neomutt stack

davmail makes local IMAP/SMTP server
port 1143 - lstmed
port 1144 - UoL

It handles the connection to offce365
The UoL one has to pretend to be outlook
https://github.com/mguessan/davmail/issues/71
https://sourceforge.net/p/davmail/bugs/702/
As davmail not approved
Then neomutt connects via locahost

To start davmail servers
~/executables/davmail/davmail ~/.davmail.properties
is for LSTM

and
~/executables/davmail/davmail .davmail.properties2
is for UoL

mbsync gets mailboxes and brings them locally
index with notmuch new
scan for spam using bogofilter
this is wrapped in the bogofilter_spam.sh script

run a cron job with

*/5 * * * * killall mbsync &>/dev/null; /opt/homebrew/bin/mbsync -a -V 2>&1 > ~/.mbsync_log
*/5 * * * * killall notmuch &>/dev/null; /opt/homebrew/bin/notmuch new 2>&1 > ~/.notmuch_log

or wrapped in script with
*/5 * * * *  /Users/joelewis/.config/neomutt/sync_mail.sh 2>&1 > sync_mail.log
