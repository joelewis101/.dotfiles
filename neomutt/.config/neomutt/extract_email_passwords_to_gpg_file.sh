#!/bin/zsh
#
# Use op cli to extract password to encrypted files to use in .mbsyncrc
# and neomuttrc
#
/usr/local/bin/op item get doctors.org.uk --fields label=password > doctors_pwd.txt
/opt/homebrew/bin/gpg -r joelewis101@doctors.org.uk -e doctors_pwd.txt
rm doctors_pwd.txt

/usr/local/bin/op item get lstmed.ac.uk --fields label=password > lstmed_pwd.txt
/opt/homebrew/bin/gpg -r joelewis101@doctors.org.uk -e lstmed_pwd.txt
rm lstmed_pwd.txt

/usr/local/bin/op item get oaluk6fksfet3mi37jzff5ls3q --fields label=password > uol_pwd.txt
/opt/homebrew/bin/gpg -r joelewis101@doctors.org.uk -e uol_pwd.txt
rm uol_pwd.txt
